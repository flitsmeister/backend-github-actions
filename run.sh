set -e
test $(git grep "test.only(" -- '*.js' | wc -l) -eq 0
echo "test.only succeeds"
test $(git grep "experiment.only(" -- '*.js' | wc -l) -eq 0
echo "experiment.only succeeds"
test $(git grep "suite.only(" -- '*.js' | wc -l) -eq 0
echo "suite.only succeeds"
test $(git grep "Mockery.enable(" -- '*.js' | wc -l) -eq `expr $(git grep "Mockery.disable\|Mockery.deregisterAll(" -- '*.js' | wc -l) / 2`
echo "Mockery succeeds"
test $(git grep "experiment.skip(" -- '*.js' | wc -l) -eq 0
echo "experiment.skip succeeds"
test $(git grep "suite.skip(" -- '*.js' | wc -l) -eq 0
echo "suite.skip succeeds"