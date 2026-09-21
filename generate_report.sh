#!/bin/bash

# This script runs E2E tests, converts the output to JUnit, and launches Allure.
# Usage: ./generate_report.sh [DEVICE_ID]
# Example: ./generate_report.sh emulator-5554

DEVICE_FLAG=""
if [ -n "$1" ]; then
  DEVICE_FLAG="-d $1"
fi

echo "🚀 Running E2E tests in 'machine' format..."
# Execute the test and output the results in raw JSON format
fvm flutter test --machine integration_test/features/home_navigation_test.dart $DEVICE_FLAG > test_results.json

echo "🔄 Converting results to JUnit format (XML)..."
# Convert the JSON output to a report.xml file using the Dart tool
cat test_results.json | tojunit --output report.xml

echo "📊 Generating visual report with Allure..."
# Allure requires a directory with results, so we create one and copy the XML
mkdir -p allure-results
cp report.xml allure-results/

# Generate a clean web report
allure generate allure-results --clean -o allure-report

echo "🌐 Opening the dashboard in the browser..."
# Start the local server to view the interactive report
allure open allure-report
