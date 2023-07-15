# PROG8470-IOS-Assignment2-Laptop-Monitor-Store

Assignment2 project of PROG8470 IOS development of Conestoga College. This app can add laptop into tableView, but the monitor is unavailable.

## Initial State

![](doc/images/2023-07-14-20-46-27-image.png)

## Laptop Table View

![](doc/images/2023-07-14-20-47-08-image.png)

Add New Item

![](doc/images/2023-07-14-20-47-56-image.png)

## Monitor Alert

![](doc/images/2023-07-14-20-48-55-image.png)

## Customized Table Cell

Every table cell of laptop should contain brand, price and basic frequency. This need to create a new class to inherit UITableViewCell class, and keep these three properties.

![](doc/images/2023-07-14-20-55-45-image.png)

Replace default UITableViewCell and set a new Identifier

![](doc/images/2023-07-14-20-57-07-image.png)

![](doc/images/2023-07-14-20-58-19-image.png)

## Bind multi-Layer array with table view

data source array, it contains title, subtitle and price as mapping of the customized properties. 

![](doc/images/2023-07-14-21-00-43-image.png)

![](doc/images/2023-07-14-21-00-01-image.png)
