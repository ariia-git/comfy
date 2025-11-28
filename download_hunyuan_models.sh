#!/bin/bash

## how to use
# chmod +x download_hunyuan_models.sh
# ./download_hunyua_models.sh /data/ai/ComfyUI // path to ComfyUi directory

# Stop on error (optional)
set -e

# ComfyUI directory:
# - If you pass an argument, use that as the ComfyUI dir
# - Otherwise default to: ~/test1/ComfyUI
COMFYUI_DIR="${1:-$HOME/workspace/ComfyUI}"

echo "Using ComfyUI directory: $COMFYUI_DIR"

# Base models directory
MODELS_DIR="$COMFYUI_DIR/models"

# 1) clip_vision
wget -P "$MODELS_DIR/clip_vision" \
  "https://huggingface.co/Comfy-Org/sigclip_vision_384/resolve/main/sigclip_vision_patch14_384.safetensors"

# 2) text_encoders
wget -P "$MODELS_DIR/text_encoders" \
  "https://huggingface.co/Comfy-Org/HunyuanVideo_1.5_repackaged/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors" \
  "https://huggingface.co/Comfy-Org/HunyuanVideo_1.5_repackaged/resolve/main/split_files/text_encoders/byt5_small_glyphxl_fp16.safetensors"

# 3) latent_upscale_models
wget -P "$MODELS_DIR/latent_upscale_models" \
  "https://huggingface.co/Comfy-Org/HunyuanVideo_1.5_repackaged/resolve/main/split_files/latent_upscale_models/hunyuanvideo15_latent_upsampler_1080p.safetensors"

# 4) diffusion_models
wget -P "$MODELS_DIR/diffusion_models" \
  "https://huggingface.co/Comfy-Org/HunyuanVideo_1.5_repackaged/resolve/main/split_files/diffusion_models/hunyuanvideo1.5_1080p_sr_distilled_fp16.safetensors" \
  "https://huggingface.co/Comfy-Org/HunyuanVideo_1.5_repackaged/resolve/main/split_files/diffusion_models/hunyuanvideo1.5_720p_i2v_fp16.safetensors"

# 5) vae
wget -P "$MODELS_DIR/vae" \
  "https://huggingface.co/Comfy-Org/HunyuanVideo_1.5_repackaged/resolve/main/split_files/vae/hunyuanvideo15_vae_fp16.safetensors"
