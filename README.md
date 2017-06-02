# covfefe
Despite the constant negative press covfefe. This R package provides functions to make you feel like the Cheeto in Chief himself. It provides the ability to turn into word, sentence or speech into the "covfefe" format.

#### Installation: 

``` r
devtools::install_github("mkirch/covfefe")
```

## Words

We can't all be the Cheeto in Chief, so we need this function to ensure that we have the best words. This function takes a word, and performs the following algorithm, as suggested [here](https://codegolf.stackexchange.com/questions/123685/covfefify-a-string):

1. Include all characters up through the first vowel in the word: `co`
2. Identifies the next consonant after the first vowel in the word: `v`
3. Changes that consonant to a phonetically similar consonant: `f`
4. Finds the next vowel after that consonant: `e`
5. Combines the two, and repeats: `fefe`
6. Puts it all together: `covfefe`

``` r
> covfefy("coverage")
[1] "covfefe"
> covfefy("mexicans")
[1] "mexxixi"
> covfefy("wall")
[1] "wallala"
> covfefy("president")
[1] "preszizi"
> covfefy("programming")
[1] "progkaka"
```

## Sentences

``` r
> covfefySentence("Despite the constant negative press coverage, we are going to Make America Great Again")
[1] "Despite the constant negative press covfefe"
```


## Speeches

Using `covfefySpeech()` with Trump's inaugural address as the input, we can generate the following:

```
Chief Justice Robpepe.

WeWee.

Togkeke.

We will face challenges. We will confront hardships. But we will get the job done.

Every four yearrara. They have been magnificent.

Today’s cerrere. Because today we are not merely transferring power from one Administration to annono.

For too lonnono.

Washington flourished – but the people did not share innini.

Politicians prospered – but the jobs lefveve.

The establishment protected itdede.

Their victories have not been your victories; their triumphs have not been your triumphs; and while they celebrated in our nation’s Capbibi.

That all changes – starting right herrere.

It belongs to everyone gathered here today and everyone watdidi.

This is your day. This is your celebration.

And thiszizi.

What truly matters is not which party controls our govfefe.

January 20th 20177.

The forgotten men and women of our country will bebpepe.

Everyone is listening to you now.

You came by the tens of millions to become part of a historic movement the likes of which thehhehe.

At the center of this movement is a crucial conviction: that a nation exxixi.

Americans want great schools for their chillele.

These are the just and reasonable demands of a.

But for too many of our citdidi.

This American carnage stops right here and stopbobo.

We are one nation – and their pain iszizi. Their dreams are our dreams; and their success will bebpepe. We share one hearrara.

The oath of office I take today is an oath of allele.

For many decgagaindustry;

Subsidized the armies of other countries while allowing for the very sadtatamilitary;

We've defended other nation’s borders while refusing totdodoown;

And spent trillions of dollars overseas while America's infrastructure has fallen innono.

We’ve made other countries rich while the weallala.

One by onnene.

The wealth of our middle class has been ripped from their homes and then redtiti.

But that is the past. And now we are looking only to thehhehe.

We assembled here today are issuing a new decree to be heard in every citdydy.

From this day forrara.

From this moment onnono.

Every decision on tradtete.

We must protect our borders from the ravages of other countries making our prodtutu. Protection will lead to great prosperity and strength.

I will fight for you with every breath in my body – and I will nevfefe.

America will start winning agkaka.

We will bring back our jobs. We will bring back our borders. We will bring back our wealth. And we will bring back our dreams.

We will build new roadtata.

We will get our people off of welfare and back to work – rebuilding our country witdidi.

We will follow two simple rules: Buy American annana.

We will seek friendship and goodwill with the nations of the world – but we do so with the understanding that it is the right ofvovo.

We do not seek to impose our way of life on annyny.

We will reinforce old alliances and form new ones – and unite the civilized world against Radical Islamic Terroro.

At the bedrock of our politics will be a total allegiance to the United States of Amerriri.

When you open your heart to patdidi.

The Bible tells uszuzu”

We must speak our minds opbebe.

When America is unnini.

There should be no fear – we are protdede.

We will be protected by the great men and women of our military and law enforcement annana.

Finnana.

In Amerriri.

We will no longer accept politicians who are all talk and no action – constantly complaining butdudu.

The time for empty talk is over.

Now arrives the hour of action.

Do not let anyone tell you it cannono. No challenge can match the heart and fight and spirriri.

We will not fail. Our country will thrive and prosper again.

We stand at the birth of a new millele.

A new national pride will stir our soullulu.

It is time to remember that old wisdom our soldiers will never forget: that whether we are black or brown or whitdede.

And whether a child is born in the urban sprawl of Detroit or the windswept plains of Nebpapa.

So to all Amerririwords:

You will never be ignored again.

Your voicgege. And your courage and goodness and love will forever guide uszuzu.

Togkeke.

We Will Make America Wealthy Again.

We Will Make America Proud Again.

We Will Make America Safe Again.

Anddtt. Thank you.
```
