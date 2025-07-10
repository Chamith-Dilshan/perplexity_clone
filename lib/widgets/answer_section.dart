import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
## Easy Cocktails to Make at Home

You don’t need fancy equipment or rare ingredients to enjoy a delicious cocktail at home. Here are some classic and simple recipes you can make with just a few basic ingredients.

### 1. Margarita
- **Ingredients:**
  - 2 oz tequila
  - 1 oz Cointreau (or triple sec)
  - 1 oz fresh lime juice
  - Salt for rim (optional)
- **Method:**  
  Rub a lime wedge around the rim of a glass and dip in salt if desired. Shake tequila, Cointreau, and lime juice with ice. Strain into the glass over fresh ice. Garnish with a lime wedge[1].

### 2. Moscow Mule
- **Ingredients:**
  - 2 oz vodka
  - 1/2 oz fresh lime juice
  - 4 oz ginger beer
- **Method:**  
  Combine vodka and lime juice in a mug or glass filled with ice. Top with ginger beer and stir gently. Garnish with a lime wedge[2].

### 3. Gin and Tonic
- **Ingredients:**
  - 2 oz gin
  - 4-6 oz tonic water
  - Lime wedge
- **Method:**  
  Fill a glass with ice, add gin, and top with tonic water. Stir gently and garnish with a lime wedge[1].

### 4. Whiskey Sour
- **Ingredients:**
  - 2 oz whiskey (bourbon or rye)
  - 3/4 oz lemon juice
  - 3/4 oz simple syrup (equal parts sugar and water)
- **Method:**  
  Shake all ingredients with ice. Strain into a glass over fresh ice. Garnish with a cherry or lemon slice[1][3].

### 5. Daiquiri
- **Ingredients:**
  - 1.5 oz white rum
  - 1 oz lime juice
  - 0.5 oz simple syrup
- **Method:**  
  Shake all ingredients with ice. Strain into a cocktail glass. Garnish with a lime wedge[4].

### 6. Paloma
- **Ingredients:**
  - 2 oz tequila
  - 6 oz grapefruit soda (or fresh grapefruit juice + club soda)
  - Lime wedge
- **Method:**  
  Pour tequila into a glass with ice, top with grapefruit soda, and garnish with a lime wedge[1][3].

### 7. Screwdriver
- **Ingredients:**
  - 2 oz vodka
  - 4 oz orange juice
- **Method:**  
  Fill a glass with ice, add vodka, top with orange juice, and stir[3].

### 8. White Russian
- **Ingredients:**
  - 2 oz vodka
  - 1 oz coffee liqueur (like Kahlúa)
  - 0.5 oz heavy cream
- **Method:**  
  Combine vodka and coffee liqueur in a glass with ice. Top with cream and stir gently[1][3].

### 9. Mojito
- **Ingredients:**
  - 2 oz white rum
  - 1 oz lime juice
  - 2 tsp sugar
  - Mint leaves
  - Club soda
- **Method:**  
  Muddle mint and sugar in a glass. Add rum, lime juice, and ice. Top with club soda and stir. Garnish with mint[3].

### 10. Tequila Sunrise
- **Ingredients:**
  - 2 oz tequila
  - 4 oz orange juice
  - 0.5 oz grenadine
- **Method:**  
  Fill a glass with ice, add tequila and orange juice, then slowly pour in grenadine to create a sunrise effect. Garnish with an orange slice[3].

## Tips for Home Cocktails
- Use fresh citrus juice for the best flavor.
- If you don’t have a shaker, use a jar with a tight lid.
- Simple syrup is easy: mix equal parts sugar and water until dissolved.

These recipes are quick, require minimal ingredients, and are perfect for beginners or anyone wanting a tasty drink at home[2][1][3][4]. Enjoy experimenting!

[1] https://www.themanual.com/food-and-drink/easy-cocktail-recipes/
[2] https://www.delish.com/entertaining/g43687930/easy-cocktails/
[3] https://www.tasteofhome.com/collection/easy-mixed-drinks/
[4] https://vinepair.com/articles/30-best-easy-cocktail-recipes/
[5] https://www.bbc.co.uk/food/collections/easy_cocktails
[6] https://www.thespruceeats.com/cheap-drinks-to-make-at-home-759877
[7] https://cocktailcollective.co.nz/blogs/recipes
[8] https://www.youtube.com/watch?v=Kya8FuxMoQs
[9] https://iba-world.com/cocktails/all-cocktails/
[10] https://www.purewow.com/food/easy-cocktail-recipes
[11] https://www.reddit.com/r/cocktails/comments/12dq3u2/what_are_some_easy_cocktails_i_can_make_at_home/
[12] https://www.liquor.com/classic-cocktails-5217936
[13] https://abeautifulmess.com/20-delicious-cocktails/
[14] https://www.nationalbartenders.com/blog/cocktails-every-bartender-should-know/
[15] https://www.mashed.com/1009513/easy-cocktails-anyone-can-make-at-home/
[16] https://www.epicurious.com/recipes-menus/classic-cocktails
[17] https://www.loveandlemons.com/summer-cocktails/
[18] https://www.diffordsguide.com/cocktails
[19] https://www.taste.com.au/galleries/simple-cocktail-recipes-always-impress/thx3esmn
[20] https://www.socialandcocktail.co.uk/cocktail-recipes/
''';
  final answerAnimationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (data['data'] != null) {
        if (isLoading) {
          fullResponse = '';
        }
        setState(() {
          fullResponse += data['data'];
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    answerAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: answerAnimationController,
          builder: (context, _) {
            return Skeletonizer(
              enabled: isLoading,
              child: GptMarkdown(
                fullResponse,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGrey,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
