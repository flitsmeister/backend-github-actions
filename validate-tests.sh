
echo "Checking for skipped tests..."
TEST_CHECK=$(git grep -n '\(test\|experiment\|suite\).\(only\|skip\)' -- '*.js') RCODE=$?
if [ $RCODE -ne 1 ]; then
  echo "STOP: You're still skipping tests"
  echo "$TEST_CHECK"
  exit 1
else
  echo "No skipped tests!"
fi

echo "Checking for mockery enable / disable / deregisters..."
MOCKERY_ENABLES=$(git grep "Mockery.enable(" -- '*.js' | wc -l)
MOCKERY_DISABLED=$(git grep "Mockery.disable\|Mockery.deregisterAll(" -- '*.js' | wc -l)
MOCKERY_ENABLES_DOUBLE=$(($MOCKERY_ENABLES * 2))
if [ $MOCKERY_ENABLES_DOUBLE -ne $MOCKERY_DISABLED ]; then
  echo "STOP: Mockery enables: $MOCKERY_ENABLES vs $MOCKERY_DISABLED disables / deregisterAlls (should be double)"
  exit 1
else
  echo "Mockery is fine!"
fi
