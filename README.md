# Flowspace Bakery

Flowspace Bakery is an artisanal digital bakery, crafting the finest digital cookies in New York City.

We don't mass produce our cookies in faceless factories. Instead, We bake cookies to order, one at a time.

## Development Instructions

The following bugs fixes or features need to be completed:

1. Bug: "no fillings" text is never displayed when cookies have no fillings

2. Feature: Cookies should actually be cooked
   We lazily added to Cookie: def ready?; true; end
   But, the cookies are not actually ready instantly! When a cookie is placed in the oven, we need to trigger a background cooking worker to cook the cookies and update their state after a couple minutes of "cooking"

3. Feature: As a bakery owner, I should see the oven page update automatically when the cookies are ready
   Given I have unfinished cookies in an oven
   And I am on the oven page
   Then I should see that the cookies are not yet ready
   When the cookies finish cooking
   Then I should see that the cookies are ready
   Note: Periodic polling is acceptable, but only the relevant part of the page should update

Steps 2 and 3 can be on the same branch:

- Need some action to happen before ready returns true
- Create a baker function that implements some sort of timer and while the timer is running, display that the cookies are baking on the oven page.
- In ready before returning true, run baker function as a callback function, once baker function has run, then ready function will return true and oven will display the cookies are ready and can be retrieved

4. Feature: As a bakery owner, I should be able to place a sheet with multiple cookies into an oven
   Given I have an oven
   When I am on the oven page
   Then I should be able to prepare a batch of cookies with the same filling
   When the batch of cookies is finished cooking
   Then I should be able to remove the cookies into my store inventory

   - Technically, all cookies can be on a sheet which means we always are baking a sheet of cookies now.
   - Create a new table in the db called sheet that can contain many cookies only if the fillings are the same.
   - Ovens can have one sheet.
   - Add a quantity field to the new cookie form to allow user to select how many cookies with a particular filling they want to bake.
   - If the quantity of new cookie is greater than 1, then multiple cookies can be baked at the same time and added in a batch to the store.
   - When creating a cookie we need some logic to check is the oven contains a sheet instead of a cookie. If there is no sheet in the oven, then we can create cookies and store them in a sheet. Then bake the sheet and once the sheet is baked, the oven will empty, and cookies will display in the store.

5. Feature: As a bakery owner using the mobile web, I want my "Prepare Cookie" button to be first
   Since the Prepare Cookie button is really important, when the bakery owner is using a mobile screen, the prepare cookie button should be the first thing on the oven page. But, on non-mobile browsers, the button should remain where it is currently.

HTTP Auth access: bake / somecookies

## Test Suite

Like most bakeries, Flowspace Bakery has a test suite. The full suite can be run with:

`$ rspec spec`

## Requirements

This application requires:

- Ruby 2.6.2
- PostgreSQL server running on localhost

## Similar Projects

[Momofuku milk bar](http://milkbarstore.com/)
