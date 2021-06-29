#! /usr/bin/env bash

METALLB_IP_RANGE='10.0.0.40-10.0.0.49'

microk8s enable \
    dns \
    ingress \
    "metallb:$METALLB_IP_RANGE" \
    rbac \
    storage

