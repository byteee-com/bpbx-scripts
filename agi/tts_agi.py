#!/usr/bin/env python3

import sys
import os
from TTS.api import TTS
import uuid

def synthesize_text(text, output_path):
    model_name = "tts_models/zh-CN/baker/tacotron2-DDC"
    tts = TTS(model_name=model_name)
    tts.tts_to_file(text=text, file_path=output_path)

def main():
    text = sys.argv[1]
    unique_filename = str(uuid.uuid4()) + ".wav"
    output_path = f"/tmp/{unique_filename}"

    synthesize_text(text, output_path)

    # Print the response to Asterisk
    print(f"SET VARIABLE TTS_FILE {output_path}")

if __name__ == "__main__":
    main()
