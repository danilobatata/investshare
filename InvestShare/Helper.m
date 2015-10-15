//
//  Helper.m
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "Helper.h"
#import "VOInvestment.h"

@implementation Helper

+ (instancetype)sharedInstance {
    static Helper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[Helper alloc] init];
    });
    
    return helper;
}

- (NSString *)randomName {
    NSArray *names = @[@"André",@"Antônio",@"Arthur",@"Breno",@"Bruno",@"Caio",@"Carlos",@"Cauã",@"Daniel",@"Danilo",@"Davi",@"Diego",@"Douglas",@"Eduardo",@"Enzo",@"Erick",@"Felipe",@"Gabriel",@"Guilherme",@"Gustavo",@"Igor",@"José",@"João",@"Júlio",@"Kaio",@"Kauan",@"Kauã",@"Kauê",@"Leonardo",@"Luan",@"Lucas",@"Luiz",@"Luís",@"Marcos",@"Mateus",@"Matheus",@"Miguel",@"Murilo",@"Nicolas",@"Otávio",@"Paulo",@"Pedro",@"Rafael",@"Renan",@"Ryan",@"Samuel",@"Thiago",@"Victor",@"Vinícius",@"Vitór",@"Alice",@"Aline",@"Amanda",@"Ana",@"Anna",@"Beatriz",@"Bianca",@"Brenda",@"Bruna",@"Camila",@"Carolina",@"Clara",@"Eduarda",@"Emilly",@"Emily",@"Evelyn",@"Fernanda",@"Gabriela",@"Gabrielle",@"Gabrielly",@"Giovana",@"Giovanna",@"Isabela",@"Isabella",@"Isabelle",@"Júlia",@"Lara",@"Larissa",@"Laura",@"Lavinia",@"Letícia",@"Livia",@"Luana",@"Luiza",@"Manuela",@"Maria",@"Mariana",@"Marina",@"Melissa",@"Nicole",@"Rafaela",@"Raissa",@"Rebeca",@"Sarah",@"Sofia",@"Sophia",@"Thaís",@"Vitória",@"Yasmin",@"Ágatha"];
    
    NSArray *surnames = @[@"Almeida",@"Alvaréz",@"Alves",@"Araújo",@"Azevedo",@"Barbosa",@"Barboza",@"Cardoso",@"Carvalho",@"Cavalcante",@"Cavalcanti",@"Correa",@"Correia",@"Costa",@"Dias",@"Díaz",@"Fernandes",@"Fernandez",@"Ferreira",@"German",@"Gomes",@"Gomez",@"Gonzáles",@"Gonçalves",@"Gónzalez",@"Lima",@"Martins",@"Mello",@"Melo",@"Montes",@"Moraes",@"Morais",@"Oliveira",@"Pereira",@"Ribeiro",@"Rocha",@"Rodrigues",@"Santos",@"Schmidt",@"Schmitz",@"Silva",@"Sousa",@"Souza",@"Teixeira"];
    
    NSInteger j = arc4random() % names.count;
    NSInteger k = arc4random() % surnames.count;
    NSString *name = [NSString stringWithFormat:@"%@ %@", names[j], surnames[k]];
    
    return name;
}

- (UIImage *)randomProfileImage {
    NSInteger i = (arc4random() % 40) + 1;
    NSString *imageName = [NSString stringWithFormat:@"%03ld.jpg", i];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

- (NSString *)randomRisk {
    NSArray *risks = @[@"Risco A", @"Risco B", @"Risco C", @"Risco D"];
    NSInteger i = arc4random() % risks.count;
    return risks[i];
}

- (NSInteger)randomValueUntil:(NSInteger)value {
    NSInteger i = (arc4random() % value) + 1;
    return i;
}

- (NSString *)formatCurrencyFromValue:(NSInteger)value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"pt-BR"]];
    return [formatter stringFromNumber:@(value)];
}

- (NSString *)formatTimeFromValue:(NSInteger)value {
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

- (NSArray *)randomInvestments {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger i = 0; i<=20; i++) {
        @autoreleasepool {
            VOInvestment *investment = [[VOInvestment alloc] init];
            investment.thumb = [self randomProfileImage];
            investment.name = [self randomName];
            investment.income = [NSString stringWithFormat:@"%ld%%", [self randomValueUntil:100]];
            investment.risk = [self randomRisk];
            investment.time = [self formatTimeFromValue:[self randomValueUntil:100]];
            investment.value = [self formatCurrencyFromValue:[self randomValueUntil:1000] * 1000];
            investment.desc = @"Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Quisque volutpat augue enim, pulvinar lobortis nibh lacinia at. Vestibulum nec erat ut mi sollicitudin porttitor id sit amet risus.";
            
            [tempArray addObject:investment];
        }
    }
    
    return [tempArray copy];
}

@end
