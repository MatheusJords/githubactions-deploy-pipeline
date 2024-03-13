#!/bin/bash

codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null https://adopet-frontend-cypress.vercel.app/home)
echo $codigo_http