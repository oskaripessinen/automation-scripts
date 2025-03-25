#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Running Notia Tests..."
echo "====================="

# Run backend tests
echo -e "\n${GREEN}Running Backend Tests...${NC}"
cd notia-server && npm test

# Store the backend test result
BACKEND_RESULT=$?

# Run frontend tests
echo -e "\n${GREEN}Running Frontend Tests...${NC}"
cd ../notia-client && npm test -- --watchAll=false

# Store the frontend test result
FRONTEND_RESULT=$?

# Check if any tests failed
if [ $BACKEND_RESULT -eq 0 ] && [ $FRONTEND_RESULT -eq 0 ]; then
    echo -e "\n${GREEN}All tests passed!${NC}"
    exit 0
else
    echo -e "\n${RED}Some tests failed!${NC}"
    exit 1
fi