//
//  Helper.m
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "Helper.h"
#import "Macros.h"

@implementation Helper

+ (instancetype)sharedInstance {
    static Helper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[Helper alloc] init];
    });
    
    return helper;
}

#pragma mark - Getters
+ (NSArray *)names {
    static NSArray *_names = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _names = @[@"André",@"Antônio",@"Arthur",@"Breno",@"Bruno",@"Caio",@"Carlos",@"Cauã",@"Daniel",@"Danilo",@"Davi",@"Diego",@"Douglas",@"Eduardo",@"Enzo",@"Erick",@"Felipe",@"Gabriel",@"Guilherme",@"Gustavo",@"Igor",@"José",@"João",@"Júlio",@"Kaio",@"Kauan",@"Kauã",@"Kauê",@"Leonardo",@"Luan",@"Lucas",@"Luiz",@"Luís",@"Marcos",@"Mateus",@"Matheus",@"Miguel",@"Murilo",@"Nicolas",@"Otávio",@"Paulo",@"Pedro",@"Rafael",@"Renan",@"Ryan",@"Samuel",@"Thiago",@"Victor",@"Vinícius",@"Vitór"];
    });
    
    return _names;
}

+ (NSArray *)surnames {
    static NSArray *_surnames = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _surnames = @[@"Almeida",@"Alvaréz",@"Alves",@"Araújo",@"Azevedo",@"Barbosa",@"Barboza",@"Cardoso",@"Carvalho",@"Cavalcante",@"Cavalcanti",@"Correa",@"Correia",@"Costa",@"Dias",@"Díaz",@"Fernandes",@"Fernandez",@"Ferreira",@"German",@"Gomes",@"Gomez",@"Gonzáles",@"Gonçalves",@"Gónzalez",@"Lima",@"Martins",@"Mello",@"Melo",@"Montes",@"Moraes",@"Morais",@"Oliveira",@"Pereira",@"Ribeiro",@"Rocha",@"Rodrigues",@"Santos",@"Schmidt",@"Schmitz",@"Silva",@"Sousa",@"Souza",@"Teixeira"];
    });
    
    return _surnames;
}

#pragma mark - Public Methods
+ (LoggedUser *)loggedUser {
    NSData *myEncodedObject = [NSUserDefaults objectForKey:kProfileInfo];
    LoggedUser* obj = (LoggedUser *)[NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
    
    return obj;
}

+ (void)saveCustomObject:(id)obj forKey:(NSString *)key {
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    [NSUserDefaults setObject:myEncodedObject forKey:key];
    [NSUserDefaults synchronize];
}

+ (NSString *)randomName {
    NSInteger j = arc4random() % self.names.count;
    NSInteger k = arc4random() % self.surnames.count;
    NSString *name = [NSString stringWithFormat:@"%@ %@", self.names[j], self.surnames[k]];
    
    return name;
}

+ (NSString *)randomProfileImage {
    NSInteger i = (arc4random() % 10) + 1;
    NSString *imageName = [NSString stringWithFormat:@"%03ld.jpg", i];
    return imageName;
}

+ (NSString *)randomRisk {
    NSArray *risks = @[@"Risco A", @"Risco B", @"Risco C", @"Risco D"];
    NSInteger i = arc4random() % risks.count;
    return risks[i];
}

+ (NSInteger)randomValueUntil:(NSInteger)value {
    NSInteger i = (arc4random() % value) + 1;
    return i;
}

+ (NSString *)formatCurrencyFromValue:(NSInteger)value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"pt-BR"]];
    return [formatter stringFromNumber:@(value)];
}

+ (NSString *)formatTimeFromValue:(NSInteger)value {
    NSInteger months = value % 12;
    NSInteger years = value / 12;
    
    NSString *time;
    if (years > 0) {
        time = [NSString stringWithFormat:@"%ld anos", years];
    }
    else {
        time = [NSString stringWithFormat:@"%ld meses", months];
    }
    
    return time;
}

+ (NSString *)initialsFromName:(NSString *)name {
    NSMutableString * firstCharacters = [NSMutableString string];
    NSArray * words = [name componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    for (NSString *word in words) {
        if (word.length > 0) {
            NSString * firstLetter = [word substringWithRange:[word rangeOfComposedCharacterSequenceAtIndex:0]];
            [firstCharacters appendString:[firstLetter uppercaseString]];
        }
    }
    
    return firstCharacters;
}

+ (UIColor *)randomColor {
    CGFloat g = arc4random() % 256;
    CGFloat b = arc4random() % 256;
    return UIColorFromRGB(0, g, b);
}

@end
