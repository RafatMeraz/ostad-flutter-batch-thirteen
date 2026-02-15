import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:desktop_audio_capture/audio_capture.dart';

class AudioCaptureUseCase {
  final SystemAudioCapture _systemCapture = SystemAudioCapture();
  final MicAudioCapture _micCapture = MicAudioCapture();

  StreamSubscription? _systemSub;
  StreamSubscription? _micSub;
  IOSink? _systemSink;
  IOSink? _micSink;

  String? _tempDir;

  Future<void> startRecording() async {
    final dir = await getTemporaryDirectory();
    _tempDir = dir.path;

    // 1. Setup file paths
    final systemRawPath = "$_tempDir/system.raw";
    final micRawPath = "$_tempDir/mic.raw";

    // 2. Prepare files (delete old ones if they exist)
    if (await File(systemRawPath).exists()) await File(systemRawPath).delete();
    if (await File(micRawPath).exists()) await File(micRawPath).delete();

    _systemSink = File(systemRawPath).openWrite();
    _micSink = File(micRawPath).openWrite();

    // 3. Start hardware
    await _systemCapture.startCapture();
    await _micCapture.startCapture();

    // 4. Record independently (This prevents the "Noise" issue)
    _systemSub = _systemCapture.audioStream?.listen((data) => _systemSink?.add(data));
    _micSub = _micCapture.audioStream?.listen((data) => _micSink?.add(data));
  }

  Future<String?> stopRecording(String finalFileName) async {
    // 1. Stop streams
    await _systemSub?.cancel();
    await _micSub?.cancel();

    // 2. Close files
    await _systemSink?.flush();
    await _systemSink?.close();
    await _micSink?.flush();
    await _micSink?.close();

    // 3. Stop hardware
    await _systemCapture.stopCapture();
    await _micCapture.stopCapture();

    // 4. Merge using FFmpeg
    return await _mergeAudioFiles(finalFileName);
  }

  Future<String?> _mergeAudioFiles(String outputName) async {
    final systemRaw = "$_tempDir/system.raw";
    final micRaw = "$_tempDir/mic.raw";
    final appDir = await getApplicationDocumentsDirectory();
    final outputPath = "${appDir.path}/$outputName.wav";

    // FFmpeg Command Breakdown:
    // -f s16le: Tells FFmpeg the input is Raw 16-bit PCM
    // -ar 16000: Sets sample rate (plugin default)
    // -ac 1: Mono
    // amix: The filter that perfectly mixes the two streams
    final result = await Process.run('ffmpeg', [
      '-y', // Overwrite output if exists
      '-f', 's16le', '-ar', '16000', '-ac', '1', '-i', systemRaw,
      '-f', 's16le', '-ar', '16000', '-ac', '1', '-i', micRaw,
      '-filter_complex', 'amix=inputs=2:duration=longest',
      outputPath,
    ]);

    if (result.exitCode == 0) {
      print("Success! File saved at: $outputPath");
      return outputPath;
    } else {
      print("FFmpeg Error: ${result.stderr}");
      return null;
    }
  }
}