#!/bin/bash
# 4C8T config running
unset ZE_AFFINITY_MASK
accelerate launch                                                \
    --config_file examples/accelerate/fsdp_config_4c8t.yaml      \
    src/train.py examples/train_lora/qwen3_lora_sft.yaml
