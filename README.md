Using XCode 11.2.1

MVP

## Target of this code to calculate distance between two locations on Earth:

After exploring different ways of Great-Circle distance calculation laws, I find that Haversine Formula is the best practice for a small distances

## Here’s the original formula:
<img width="883" alt="Screen Shot 2020-01-24 at 11 52 58 PM" src="https://user-images.githubusercontent.com/10711043/73242770-89c93000-41ae-11ea-9e26-d6ffd954d371.png">

## And here’s the function on swift:
<img width="1132" alt="Screen Shot 2020-01-28 at 9 02 13 AM" src="https://user-images.githubusercontent.com/10711043/73242795-98afe280-41ae-11ea-9895-aab485f34347.png">

## How to install

1) Use XCode to open NearByCustomers.xcodeproj file
2) Run the app
3) First screen contains list of customer from https://s3.amazonaws.com/intercom-take-home-test/customers.txt
4) Press "Find Nearby Customer"
5) Will take you to list of near by customers after find them

## HavarsineDistance Class

It Contains how to calculate distance logic

## sampleCustomersList.txt && SampleNearbyCustomersList.txt

It contains the data coming from url https://s3.amazonaws.com/intercom-take-home-test/customers.txt as current data refreance & list of nearby customer found using Haversine Formula

## Unit tests

Included on NearByCustomersTests folder
