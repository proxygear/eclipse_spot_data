![Eclipse Spot](misc/eclipse_spot_logo.jpg)

Data YML for [Eclipse Phase RPG](http://eclipsephase.com) currently used on [Eclipse Spot](http://eclipsespot.com)
This repository was created first to allow people to accelerate data input and correct tipos and other mistakes.
However you are free to use it the way you want as long as you respect the Licence requirement.
If you find out a great usage, please let me know, i'm curious ;)

##Contributions

###Not a git user ?

If you are not a git user, then you have to:

* Download the last version of this repository by clicking on (this link)[https://github.com/proxygear/eclipse_spot_data/archive/master.zip]
* Make modifications
* Rearchive the folder
* Send it to benoy[at]eclipsespot[dot]com by email with a description of your modification and your name/nickname for the credit ;)

###Git user !

Well I think I don't have to explain you this :

* Create a github account if you don't have yet.
* Fork the repository
* Clone your repository
* Make modification
* Send a pull request and Voila !

##Formats

###Files

In data folder you will find yml files. The format is DATA_TYPE.LANG.yml.

* DATA_TYPE : traits, skills etc ...
* LANG : two letters like en, fr, es ...

###Yml format

Open one of the present file, for instance skills.en.yml
You will see that all file have the following hierachi :

````.yml
en:
  key_name:
    data1: value
    data2: value ...
````

The key_name is used as a unique item id.
It means couple of things :
* Never correct it even if it contain a typo. It's not used for display.
* If you translate content, you have to keep the same key_name to allow the system to understand that it's the same resource.

####Background data format

TODO

####Faction data format

TODO

####Skill data format

TODO

####Trait data format

TODO

####MorphPattern data format

TODO

####Gear data format

TODO

## Usage

You can use it or as a standalone or as a ruby gem.
There is a Licence section below, check it if you care about legal issues.

### Standalone Data

Just include eclipse_spot_data folder or yml file in your project and, well, it's yml so parse it yourself.

### As a ruby gem

If you are using ruby, then you can use eclipse_spot_data as a gem.
Optionaly you can provide a version if you want to prevent data update.

#### Not rails

Simply install the gem :

````.ruby
gem install git@github.com:proxygear/eclipse_spot_data.git

gem update git@github.com:proxygear/eclipse_spot_data.git
````

#### Really rails

If you are using Rails, then add in you gem file :

````.ruby
gem 'eclipse_spot_data', git: 'git@github.com:proxygear/eclipse_spot_data.git'
````

Then bundle it in your shell

````
$> bundle

$> bundle update eclipse_spot_data
````

#### Any way the code ?

Well easy, just an interface to load data type by language

````.ruby
  es_data = EclipseSpot::Data.new
  es_data.books #return book names
  #=> ['core', 'ego_hunter', ...]
  es_data.types #return type names
  #=> ['backgrounds', 'factions', ...]
  es_data.lang #return available lang
  #=> ['en', 'fr', ...]
  es_data.exist?(book: :core, type: :factions, lang: :en)
  #=> true
  es_data.exist?(type: :space_blobs)
  #=> false
  es_data.load! :core, :factions, :en
  #=> a big hash from yml file with lang/type levels removed
````

## Licence

Eclipse phase  is a trademark of Posthuman Studios, LLC. Some Rights Reserved. 
Original text content and mechanics of eclipsephase present on this website is licensed under the Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License.

## Credits

Base data was created by [proxygear.com](http://proxygear.com)