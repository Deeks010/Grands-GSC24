import librosa
import soundfile as sf
from noisereduce import reduce_noise

def reduce_bass_and_frequency(audio_path, output_path, bass_reduction_factor=0.54421768707483 ):
    # Load the audio file
    y, sr = librosa.load(audio_path)
    
    # Trim silence
    trimmed_audio, _ = librosa.effects.trim(y, top_db=20)

    # Normalize audio
    normalized_audio = librosa.util.normalize(trimmed_audio)
    
    #noice reduction
    reduced_noise = reduce_noise(normalized_audio, sr)

    # Apply bass reduction
    y_lowpassed = librosa.effects.preemphasis(reduced_noise, coef=bass_reduction_factor)

    # Apply frequency reduction
    y_downsampled = librosa.resample(y_lowpassed, orig_sr=sr, target_sr= 48000)     
    
    audio_124kbps = y_downsampled.set_channels(1).set_bit_depth(16).set_frame_rate(48000, method="set_avg_bitrate").set_actual_frame_rate(48000)
    sf.write(output_path, audio_124kbps, 48000)

#add the path to the input and output audio files
audio_path = 'path/to/input'
output_path = 'path/to/output'
reduce_bass_and_frequency(audio_path, output_path)