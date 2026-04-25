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
./user_test write /dev/shmem0_confidential \
./shared_with_VM/"$MODEL"
./inference_test_measure.sh /dev/shmem0_confidential
