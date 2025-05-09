#!/bin/bash
# 4C8T config running
unset ZE_AFFINITY_MASK

FSDP_CONFIG_FILE=examples/accelerate/fsdp_config_4c8t.yaml
SRC_FILE=src/train.py
MODEL_CONFIG_FILE=examples/train_lora/qwen3_8b_lora_sft.yaml
LOG_FILE=saves/qwen3-8b/lora/sft/qwen3_lora_sft_fsdp_4c8t.log

echo "FSDP config file: ${FSDP_CONFIG_FILE}"
echo "LLaMA Factory src file: ${SRC_FILE}"
echo "Model config file: ${MODEL_CONFIG_FILE}"
echo "Log file: ${LOG_FILE}"

accelerate launch                      \
    --config_file ${FSDP_CONFIG_FILE}  \
    ${SRC_FILE}                        \
    ${MODEL_CONFIG_FILE} 2>&1 | tee ${LOG_FILE}
