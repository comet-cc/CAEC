#!/bin/bash
set -x

MODEL="${MODEL:-gpt2-q8_0.gguf}"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --model)
            MODEL="$2"
            shift 2
            ;;
        *)
            echo "Unknown option $1"
            exit 1
            ;;
    esac
done

mount -t 9p sh ./shared_with_VM/.
systemctl daemon-reload

# Create a RAM-backed tmpfs and place the model there
RAM_DIR=/mnt/ramdisk
mkdir -p "$RAM_DIR"
mountpoint -q "$RAM_DIR" || mount -t tmpfs -o size=4G tmpfs "$RAM_DIR"

RAM_MODEL="$RAM_DIR/$(basename "$MODEL")"
cp "./shared_with_VM/$MODEL" "$RAM_MODEL"

./user_test write "$RAM_MODEL" \
    ./shared_with_VM/"$MODEL"

./inference_test_measure.sh "$RAM_MODEL"
