from TTS.tts.configs.bark_config import BarkConfig
from TTS.tts.models.bark import Bark
import scipy

config = BarkConfig()
model=Bark.init_from_config(config)
model.load_checkpoint(config,checkpoint_dir="bark/",eval=True)

model.to("cuda")

text="give your text input here"

#create a folder named "voices" in that create a folder named "speaker_name" with in the folder add the input audio
output_dir=model.synthesize(text,config,speaker_id="speaker_name",voice_dirs="voices/")

sample_rate = 24000
scipy.io.wavfile.write("output.wav", rate=sample_rate, data=output_dir["wav"])
#the output is saved as output.wav
