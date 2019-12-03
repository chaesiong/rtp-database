#!/bin/bash
sed -i -E '/[^\\][$]/ { s/[$]/\\\\\\$/g; }' install-*.sql
