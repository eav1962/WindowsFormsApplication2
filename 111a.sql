/*
MySQL Data Transfer
Source Host: localhost
Source Database: 111a
Target Host: localhost
Target Database: 111a
Date: 07.01.2021 0:07:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for analysis
-- ----------------------------
DROP TABLE IF EXISTS `analysis`;
CREATE TABLE `analysis` (
  `id` smallint(6) NOT NULL,
  `Тип_исследования` tinytext,
  `Наименование` tinytext,
  `Sleng` tinytext,
  `Междунар.обозначение` tinytext,
  `Норма_min` decimal(10,2) DEFAULT NULL,
  `Норма_max` decimal(10,2) DEFAULT NULL,
  `Норма_min_жен` decimal(10,2) DEFAULT NULL,
  `Норма_max_жен` decimal(10,2) DEFAULT NULL,
  `Норма_min_дет` decimal(10,2) DEFAULT NULL,
  `Норма_max_дет` decimal(10,2) DEFAULT NULL,
  `Примечание` text,
  `Единица_измерения` tinytext,
  `Цена` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors` (
  `id` tinyint(6) NOT NULL AUTO_INCREMENT,
  `ФИО_Врача` text,
  `Специальность` text CHARACTER SET cp1251 COLLATE cp1251_general_cs,
  `Приём_первичный` int(11) DEFAULT NULL,
  `Приём_вторичный` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=cp1251;

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `idd` smallint(6) DEFAULT NULL,
  `Дата` text,
  `Фамилия` text,
  `Имя` text,
  `Отчество` text,
  `Пол` text,
  `Год_рождения` year(4) DEFAULT NULL,
  `Приёмы` text,
  `Сумма_приём` int(11) DEFAULT NULL,
  `Анализы` tinytext,
  `Значения` tinytext,
  `Сумма_анализы` int(11) DEFAULT NULL,
  `Датта` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `analysis` VALUES ('3', 'Коагулограмма', 'Коагулограмма', 'Коагулограмма', '', null, null, null, null, null, null, '', ' ', '95000');
INSERT INTO `analysis` VALUES ('4', 'Иммуноферментный метод', 'Антитела двухспиральной ДНК', 'ДНА', 'DNA', '0.00', '20.00', '0.00', '20.00', null, null, ' ', 'U/L', '45000');
INSERT INTO `analysis` VALUES ('5', 'Иммуноферментный метод', 'Антинуклеарные антитела', 'ANA', 'ANA', null, '1.00', null, '1.00', null, null, 'Отрицательно', '+/-', '0');
INSERT INTO `analysis` VALUES ('6', 'Иммуноферментный метод', 'Антинуклеарные антитела', 'АНА', 'ANA', '1.20', null, '1.20', null, null, null, 'Положительно', '+/-', '45000');
INSERT INTO `analysis` VALUES ('7', 'Иммуноферментный метод', 'Витамин В12', 'Витамин В12', '', '160.00', '835.00', '160.00', '835.00', null, null, '', 'pg/ml', '145000');
INSERT INTO `analysis` VALUES ('8', 'Иммуноферментный метод', 'D - dimer', 'Д-димер', '', '0.00', '285.00', '0.00', '285.00', null, null, '', 'ng/ml', '100000');
INSERT INTO `analysis` VALUES ('9', 'TORCH инфекции', 'ВПГ     IgG', 'ВПГ IgG', 'ВПГ', '0.00', '0.30', '0.00', '0.30', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('10', 'TORCH инфекции', 'ЦМВ IgG', 'ЦМВ IgG', 'ЦМВ', '0.00', '0.29', '0.00', '0.29', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('11', 'TORCH инфекции', 'Уреаплазма IgG', 'уреа IgG', 'УРЕА', '0.00', '0.22', '0.00', '0.22', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('12', 'TORCH инфекции', 'Токсоплазма IgG', 'тохо IgG', 'ТОХО', '0.00', '0.30', '0.00', '0.30', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('13', 'TORCH инфекции', 'Хламидии IgG', 'хламидии IgG', 'ХЛАМИ', '0.00', '0.25', '0.00', '0.25', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('14', 'TORCH инфекции', 'Микоплазма IgG', 'мико IgG', 'МИКО', '0.00', '0.20', '0.00', '0.20', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('15', 'TORCH инфекции', 'ВПГ 1 IgM', 'ВПГ IgM', 'ВПГ', '0.00', '0.30', '0.00', '0.30', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('16', 'TORCH инфекции', 'CMV IgM', 'ЦВМ IgM', 'CMV', '0.00', '0.29', '0.00', '0.29', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('17', 'TORCH инфекции', 'Уреаплазма IgM', 'уреа IgM', 'УРЕА', '0.00', '0.22', '0.00', '0.22', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('18', 'TORCH инфекции', 'Токсоплазма IgM', 'тохо IgM', 'ТОХО', '0.00', '0.30', '0.00', '0.30', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('19', 'TORCH инфекции', 'Хламидии IgM', 'хламидии IgM', 'ХЛАМИ', '0.00', '0.25', '0.00', '0.25', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('20', 'TORCH инфекции', 'Микоплазма IgM', 'мико IgM', 'МИКО', '0.00', '0.20', '0.00', '0.20', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('21', 'TORCH инфекции', 'Rubella IgM', 'Rubella IgM', '', '0.00', '0.30', '0.00', '0.30', null, null, '', 'o.e.', '46000');
INSERT INTO `analysis` VALUES ('22', 'Аутоимунные заболевания', 'Антифосфолипидный скрининг IgG', 'АФС', '', '0.00', '10.00', '0.00', '10.00', null, null, '', 'U/mL', '0');
INSERT INTO `analysis` VALUES ('23', 'Аутоимунные заболевания', 'Интактный паратгормон', 'Паратгормон', '', '10.40', '66.50', '10.40', '66.50', null, null, '', 'pg/mL', '0');
INSERT INTO `analysis` VALUES ('24', 'Аутоимунные заболевания', 'Антитела к  Кардиолипину IgG', 'Ан Кардиолипин', '', '0.00', '10.00', '0.00', '10.00', null, null, '', 'U/mL', '0');
INSERT INTO `analysis` VALUES ('25', 'Аутоимунные заболевания', 'Антитела к  вирусному гепатиту-А IgM', 'геп  А', '', '0.00', '0.30', '0.00', '0.30', null, null, '', 'o.e.', '1');
INSERT INTO `analysis` VALUES ('26', 'Аутоимунные заболевания', 'Нуклеосомы при системной красной волчанке', 'Нуклео при СКВ', '', '0.00', '20.00', '0.00', '20.00', null, null, '', 'U/mL', '0');
INSERT INTO `analysis` VALUES ('27', 'Диагностика инфекционных заболеваний', 'Сум. антитела в сыв.кр. к антигенам лямблий', 'Лямблий', '', '0.00', '0.29', '0.00', '0.29', null, null, '', 'o.e.', '52000');
INSERT INTO `analysis` VALUES ('28', 'Диагностика инфекционных заболеваний', 'Антитела к  Brucella IgG', 'Бруцелез IgG', '', null, '9.00', null, '9.00', null, null, 'Отрицательно', 'DU', '50000');
INSERT INTO `analysis` VALUES ('29', 'Диагностика инфекционных заболеваний', 'Антитела к  Brucella IgG', 'Бруцелез IgG', '', '11.00', null, '11.00', null, null, null, 'Положительно', 'DU', '0');
INSERT INTO `analysis` VALUES ('30', 'Биохимический анализ крови', 'АЛТ', 'АЛТ', '', '5.00', '40.00', '5.00', '40.00', null, null, '', 'U/L', '20000');
INSERT INTO `analysis` VALUES ('31', 'Биохимический анализ крови', 'АСТ', 'АСТ', '', '5.00', '40.00', '5.00', '40.00', null, null, '', 'U/L', '20000');
INSERT INTO `analysis` VALUES ('32', 'Биохимический анализ крови', 'Билирубин общий', 'Б-н общ', '', '1.10', '20.50', '1.10', '20.50', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('33', 'Биохимический анализ крови', 'Билирубин прямой', 'б-н пр ', '', '0.00', '5.10', '0.00', '5.10', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('34', 'Биохимический анализ крови', 'Билирубин непрямой', 'б-н непрям', '', '1.10', '15.40', '1.10', '15.40', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('35', 'Биохимический анализ крови', 'Тимоловая проба', 'тим. проба', '', '0.00', '5.00', '0.00', '5.00', null, null, '', 'Ед S-H', '0');
INSERT INTO `analysis` VALUES ('36', 'Биохимический анализ крови', 'Мочевина', 'мочевина', '', '2.61', '8.35', '2.61', '8.35', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('37', 'Биохимический анализ крови', 'Глюкоза', 'сахар', '', '3.10', '5.50', '3.10', '5.50', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('38', 'Биохимический анализ крови', 'Остаточный азот', 'Остат. азот', '', '14.00', '28.00', '14.00', '28.00', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('39', 'Биохимический анализ крови', 'Холестерин', 'холестерин', '', '3.60', '5.20', '3.60', '5.20', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('40', 'Биохимический анализ крови', 'Липопротеиды высокой плотности', 'ЛПВП', 'ЛПВП', '0.00', '1.42', '0.00', '1.68', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('41', 'Биохимический анализ крови', 'Липопротеиды низкой плотности', 'ЛПНП', 'ЛПНП', '0.00', '3.30', '0.00', '3.30', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('42', 'Биохимический анализ крови', 'Триглицериды', 'триглицериды', '', '0.45', '1.80', '0.40', '1.52', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('43', 'Биохимический анализ крови', 'Мочевая кислота', 'моч. кислота', '', '214.00', '458.00', '149.00', '405.00', null, null, '', 'mkmol/L', '20000');
INSERT INTO `analysis` VALUES ('44', 'Биохимический анализ крови', 'Альфа-амилаза', 'амилаза', '', '0.00', '90.00', '0.00', '90.00', null, null, '', 'U/L', '20000');
INSERT INTO `analysis` VALUES ('45', 'Биохимический анализ крови', 'Щелочная фосфотаза', 'ЩФ', '', '26.00', '117.00', '26.00', '117.00', '0.00', '644.00', '0-15', 'U/L', '20000');
INSERT INTO `analysis` VALUES ('46', 'Биохимический анализ крови', 'Креатинин', 'креатинин', '', '58.00', '112.00', '58.00', '112.00', null, null, '', 'mkmol/L', '20000');
INSERT INTO `analysis` VALUES ('47', 'Биохимический анализ крови', 'Альбумин', 'альбумин', '', '35.00', '55.00', '35.00', '55.00', null, null, '', 'g/L', '20000');
INSERT INTO `analysis` VALUES ('48', 'Биохимический анализ крови', 'Общий белок', 'Общ. белок', '', '65.00', '85.00', '65.00', '85.00', null, null, '', 'g/L', '20000');
INSERT INTO `analysis` VALUES ('49', 'Биохимический анализ крови', 'Гамма трансфераза', 'Гамма ГТ', '', '11.00', '61.00', '9.00', '39.00', null, null, '', 'U/L', '20000');
INSERT INTO `analysis` VALUES ('50', 'Биохимический анализ крови', 'Лактатдегидрогеназа', 'ЛДГ', '', '225.00', '440.00', '225.00', '440.00', null, null, '', 'U/L', '20000');
INSERT INTO `analysis` VALUES ('51', 'Исследование тиреоидной функции', 'Антитела к тиреоидной пероксидазе', 'ТПО', 'Anti ТPО', '0.00', '30.00', '0.00', '30.00', null, null, '', 'IU/mL', '60000');
INSERT INTO `analysis` VALUES ('52', 'Исследование тиреоидной функции', 'Антитела к тиреоглобулину', 'Ан ТГ', 'Anti ТG', '0.00', '70.00', '0.00', '70.00', null, null, '', 'IU/mL', '0');
INSERT INTO `analysis` VALUES ('53', 'Ревматологические иследования', 'С- реактивный белок', 'СРБ', 'CRP', '0.00', '6.00', '0.00', '6.00', null, null, '', 'mg/mL', '35000');
INSERT INTO `analysis` VALUES ('54', 'Ревматологические иследования', 'Антистрептолизин - О', 'АСЛО', 'ASLO', '0.00', '200.00', '0.00', '200.00', null, null, '', 'IU/L', '15000');
INSERT INTO `analysis` VALUES ('55', 'Ревматологические иследования', 'Ревматоидный фактор', 'РФ', 'RF', '0.00', '8.00', '0.00', '8.00', null, null, '', 'IU/L', '15000');
INSERT INTO `analysis` VALUES ('56', 'Диагностика аллергии', 'Иммуноглобулин Е', 'IgE', 'Total IgE', null, null, null, null, '0.00', '0.50', '0-0.5', 'IU/mL', '50000');
INSERT INTO `analysis` VALUES ('57', 'Диагностика аллергии', 'Иммуноглобулин Е', 'IgE', 'Total IgE', null, null, null, null, '0.60', '9.60', '0.5-2', 'IU/mL', '50000');
INSERT INTO `analysis` VALUES ('58', 'Диагностика аллергии', 'Иммуноглобулин Е', 'IgE', 'Total IgE', null, null, null, null, '1.60', '33.00', '2-5', 'IU/mL', '50000');
INSERT INTO `analysis` VALUES ('59', 'Диагностика аллергии', 'Иммуноглобулин Е', 'IgE', 'Total IgE', null, null, null, null, '0.80', '52.00', '5-8', 'IU/mL', '50000');
INSERT INTO `analysis` VALUES ('60', 'Диагностика аллергии', 'Иммуноглобулин Е', 'IgE', 'Total IgE', null, null, null, null, '0.70', '86.00', '8-12', 'IU/mL', '20000');
INSERT INTO `analysis` VALUES ('61', 'Диагностика аллергии', 'Иммуноглобулин Е', 'IgE', 'Total IgE', '0.00', '25.00', '0.00', '25.00', '1.30', '70.00', '12-16', 'IU/mL', '25000');
INSERT INTO `analysis` VALUES ('62', 'Диагностика анемии', 'Ферритин', 'ферритин', '', '10.00', '120.00', '10.00', '120.00', null, null, '', 'ng/mL', '30000');
INSERT INTO `analysis` VALUES ('63', 'Диагностика инфекционных заболеваний', 'Anti ds DNA IgG', 'ДНА', '', '0.00', '20.00', '0.00', '20.00', null, null, '', 'IU/mL', '0');
INSERT INTO `analysis` VALUES ('64', 'Диагностика инфекционных заболеваний', 'Helicobacter pylory IgG', 'HP IgG', '', '0.00', '15.00', '0.00', '15.00', null, null, '', 'DU/mL', '50000');
INSERT INTO `analysis` VALUES ('65', 'Диагностика инфекционных заболеваний', 'Helicobacter pylory IgM', 'HP IgM', '', '0.00', '15.00', '0.00', '15.00', null, null, '', 'DU/mL', '50000');
INSERT INTO `analysis` VALUES ('66', 'Диагностика инфекционных заболеваний', 'Rubella virus IgM', 'Рубелла IgM', '', '0.00', '83.00', '0.00', '83.00', null, null, '', 'DU/mL', '25000');
INSERT INTO `analysis` VALUES ('67', 'Диагностика инфекционных заболеваний', 'Антитела сыв.кр. к антицитруллиновому пептиду', 'АЦЦП', '', '0.00', '10.00', '0.00', '10.00', null, null, '', 'U/mL', '0');
INSERT INTO `analysis` VALUES ('68', 'Иммунохроматографический метод. Качественное определение', 'ВИЧ 2 (IgG, IgM, IgA)', 'СПИД', '', null, null, null, null, null, null, '', '+/-', '45000');
INSERT INTO `analysis` VALUES ('69', 'Иммунохроматографический метод. Качественное определение', 'ВИЧ 1 (IgG, IgM, IgA)', 'СПИД', '', null, null, null, null, null, null, '', '+/-', '20000');
INSERT INTO `analysis` VALUES ('70', 'Иммунохроматографический метод. Качественное определение', 'HbsAg вируса гепатита В', 'Геп В', '', null, null, null, null, null, null, '', '+/-', '45000');
INSERT INTO `analysis` VALUES ('71', 'Иммунохроматографический метод. Качественное определение', 'Антитела к вирусу гепатита С', 'Геп С', '', null, null, null, null, null, null, '', '+/-', '45000');
INSERT INTO `analysis` VALUES ('72', 'Иммунохроматографический метод. Качественное определение', 'Антитела к Treponema pallidum  (IgG, IgM, IgA)', 'RW', '', null, null, null, null, null, null, '', '+/-', '45000');
INSERT INTO `analysis` VALUES ('73', 'Исследование гормонов крови', 'Трийодтиронин свободный', 'Т3 св', 'FT3', '1.90', '3.80', '1.90', '3.90', null, null, '', 'ng/mL', '40000');
INSERT INTO `analysis` VALUES ('74', 'Исследование гормонов крови', 'Тироксин свободный', 'Т4 св', 'FT4', '0.65', '1.74', '0.65', '1.74', null, null, '', 'ng/dL', '40000');
INSERT INTO `analysis` VALUES ('75', 'Исследование гормонов крови', 'Тестостерон свободный', 'Тестостерон св', 'FTEST', '2.15', '13.69', '0.30', '3.05', null, null, '', 'pg/ml', '80000');
INSERT INTO `analysis` VALUES ('76', 'Исследование гормонов крови', 'Тестостерон', 'Тестостерон', 'TEST', '1.78', '6.43', '0.16', '0.73', null, null, '', 'нмоль/л', '55000');
INSERT INTO `analysis` VALUES ('77', 'Исследование гормонов крови', 'Тироксин общий', 'Т4', 'T4', '4.40', '10.80', '4.40', '10.80', null, null, '', 'mkg/dL', '55000');
INSERT INTO `analysis` VALUES ('78', 'Исследование гормонов крови', 'Пролактин', 'Пролактин', 'PRL', '2.94', '17.80', '2.84', '28.70', null, null, '', 'нг/мл', '55000');
INSERT INTO `analysis` VALUES ('79', 'Исследование гормонов крови', 'Тиреотропный гормон', 'ТТГ', 'TSH', '0.30', '4.00', '0.30', '4.00', null, null, '', 'mlU/L', '55000');
INSERT INTO `analysis` VALUES ('80', 'Исследование гормонов крови', 'Трийодтиронин общий', 'Т3', 'T3', '0.69', '2.20', '0.69', '2.20', null, null, '', 'ng/mL', '55000');
INSERT INTO `analysis` VALUES ('81', 'Исследование гормонов крови', 'Кортизол', 'Кортизол', 'CORT', '50.00', '250.00', '50.00', '250.00', null, null, '', 'ng/mL', '0');
INSERT INTO `analysis` VALUES ('82', 'Исследование гормонов крови', 'Альдостерон', 'Альдостерон', '', '14.80', '199.40', '14.80', '199.40', null, null, '', 'pg/mL', '0');
INSERT INTO `analysis` VALUES ('83', 'Исследование гормонов крови', 'Секссвязывающий глобулин ', 'SHBG', 'SHBG', '15.00', '100.00', null, null, null, null, '', 'nmol/l', '90000');
INSERT INTO `analysis` VALUES ('84', 'Исследование гормонов крови', 'DHEA-S', 'DHEA-S', '', null, null, '0.26', '2.30', null, null, '', 'mg/ml', '1');
INSERT INTO `analysis` VALUES ('85', 'Исследование гормонов крови', 'Ренин', 'Ренин', '', '3.54', '36.36', '3.54', '36.36', null, null, '', 'pg/mL', '0');
INSERT INTO `analysis` VALUES ('86', 'Исследование гормонов крови', 'Инсулин', 'Инсулин', '', '2.26', '27.40', '2.26', '27.40', null, null, '', 'µIU/mL', '60000');
INSERT INTO `analysis` VALUES ('87', 'Исследование гормонов крови', 'Фолликулостимулирующий гормон', 'ФСГ', 'FSH', '2.50', '15.10', '2.50', '21.00', null, null, '(ФФ)', 'µIU/mL', '0');
INSERT INTO `analysis` VALUES ('88', 'Исследование гормонов крови', 'Фолликулостимулирующий гормон', 'ФСГ', 'FSH', '2.50', '15.10', '2.50', '31.20', null, null, '(Овул)', 'µIU/mL', '0');
INSERT INTO `analysis` VALUES ('89', 'Исследование гормонов крови', 'Фолликулостимулирующий гормон', 'ФСГ', 'FSH', '2.50', '15.10', '2.50', '8.40', null, null, '(ЛФ)', 'µIU/mL', '0');
INSERT INTO `analysis` VALUES ('90', 'Исследование гормонов крови', 'Фолликулостимулирующий гормон', 'ФСГ', 'FSH', '2.50', '15.10', '15.10', '201.40', null, null, '(ПМ)', 'µIU/mL', '0');
INSERT INTO `analysis` VALUES ('91', 'Исследование гормонов крови', 'Лютеинизирующий гормон', 'ЛГ', 'LH', '0.70', '7.40', '0.80', '10.50', null, null, '(ФФ)', 'IU/L', '55000');
INSERT INTO `analysis` VALUES ('92', 'Исследование гормонов крови', 'Лютеинизирующий гормон', 'ЛГ', 'LH', '0.70', '7.40', '18.40', '61.20', null, null, '(Овул)', 'IU/L', '55000');
INSERT INTO `analysis` VALUES ('93', 'Исследование гормонов крови', 'Лютеинизирующий гормон', 'ЛГ', 'LH', '0.70', '7.40', '0.80', '10.50', null, null, '(ЛФ)', 'IU/L', '55000');
INSERT INTO `analysis` VALUES ('94', 'Исследование гормонов крови', 'Лютеинизирующий гормон', 'ЛГ', 'LH', '0.70', '7.40', '8.20', '40.80', null, null, '(ПМ)', 'IU/L', '55000');
INSERT INTO `analysis` VALUES ('95', 'Исследование гормонов крови', 'Прогестерон', 'Прогестерон', '', '0.23', '0.78', '1.67', '17.85', null, null, '(ЛФ)', 'ng/mL', '55000');
INSERT INTO `analysis` VALUES ('96', 'Исследование гормонов крови', 'Прогестерон', 'Прогестерон', '', '0.23', '0.78', '0.21', '0.88', null, null, '(ФФ)', 'ng/mL', '55000');
INSERT INTO `analysis` VALUES ('97', 'Исследование гормонов крови', 'Эстрадиол', 'Эстрадиол', 'ESTR', '15.00', '60.00', '30.00', '120.00', null, null, '(ФФ)', 'ng/mL', '55000');
INSERT INTO `analysis` VALUES ('98', 'Исследование гормонов крови', 'Эстрадиол', 'Эстрадиол', 'ESTR', '15.00', '60.00', '130.00', '370.00', null, null, '(Овул)', 'ng/mL', '55000');
INSERT INTO `analysis` VALUES ('99', 'Исследование гормонов крови', 'Эстрадиол', 'Эстрадиол', 'ESTR', '15.00', '60.00', '70.00', '250.00', null, null, '(ЛФ)', 'ng/mL', '55000');
INSERT INTO `analysis` VALUES ('100', 'Исследование гормонов крови', 'Эстрадиол', 'Эстрадиол', 'ESTR', '15.00', '60.00', '15.00', '60.00', null, null, '(ПМ)', 'ng/mL', '55000');
INSERT INTO `analysis` VALUES ('101', 'Исследование гормонов крови', 'Кальцитонин', 'Кальцитонин', '', '0.20', '27.70', '0.10', '10.90', null, null, '', 'pg/ml', '80000');
INSERT INTO `analysis` VALUES ('102', 'Исследование углеводного обмена', 'Гликолизированный гемоглобин', 'Глик.Нв', 'HbA1C', '0.00', '5.70', '0.00', '5.70', null, null, '', '% HbAl', '52000');
INSERT INTO `analysis` VALUES ('103', 'Диагностика костного метаболизма', '25-OH Витамин D', 'Витамин Д', '25-OH Vit D', '30.00', '100.00', '30.00', '100.00', null, null, '', 'ng/mL', '150000');
INSERT INTO `analysis` VALUES ('104', 'Коагулограмма', 'Международное нормализованное отношение', 'МНО', 'МНО', '0.90', '1.10', '0.90', '1.10', null, null, 'У здоровых', ' ', '40000');
INSERT INTO `analysis` VALUES ('105', 'Коагулограмма', 'Международное нормализованное отношение', 'МНО', 'МНО', '2.00', '3.00', '2.00', '3.00', null, null, 'Лечение антикоагул.', ' ', '40000');
INSERT INTO `analysis` VALUES ('106', 'Коагулограмма', 'Протромбин', 'ПТИ', '', '80.00', '110.00', '80.00', '110.00', null, null, '', '%', '20000');
INSERT INTO `analysis` VALUES ('107', 'Коагулограмма', 'АЧТВ', 'АЧТВ', '', '25.00', '36.00', '25.00', '36.00', null, null, '', 'sec', '25000');
INSERT INTO `analysis` VALUES ('108', 'Коагулограмма', 'Фибриноген', 'Фибриноген', '', '2.00', '4.00', '2.00', '4.00', null, null, '', 'g/L', '35000');
INSERT INTO `analysis` VALUES ('109', 'Коагулограмма', 'Тромбиновое время', 'ТВ', 'ТВ', '17.00', '21.00', '17.00', '21.00', null, null, '', 'sec', '10');
INSERT INTO `analysis` VALUES ('110', 'Коагулограмма', 'Протромбиновое время', 'пв', 'ПВ', '13.00', '18.00', '13.00', '18.00', null, null, '', 'sec', '10');
INSERT INTO `analysis` VALUES ('111', 'Коагулограмма', 'Протромбиновое отношение', 'по', 'ПО', '0.90', '1.30', '0.90', '1.30', null, null, '', ' ', '10');
INSERT INTO `analysis` VALUES ('112', 'Коагулограмма', 'Тромботест', 'Тромботест', '', '4.00', '5.00', '4.00', '5.00', null, null, '', 'степень', '20000');
INSERT INTO `analysis` VALUES ('113', 'Коагулограмма', 'Протромбиновый показатель по Квику', 'пп', 'ПП', '60.00', '130.00', '60.00', '130.00', null, null, '', '%', '10');
INSERT INTO `analysis` VALUES ('114', 'Коагулограмма', 'Гематокрит', 'Гематокрит', '', '38.00', '48.00', '38.00', '48.00', null, null, '', '%', '20000');
INSERT INTO `analysis` VALUES ('115', 'Коагулограмма', 'Время свёртывания крови', 'Время свёртывания крови', '', '2.00', '5.00', '2.00', '5.00', null, null, '', 'min', '15000');
INSERT INTO `analysis` VALUES ('116', 'Лихорадочный антиген', 'Salmonella O', 'Лих. ан', '', null, null, null, null, null, null, '', '+/-', '0');
INSERT INTO `analysis` VALUES ('117', 'Лихорадочный антиген', 'Salmonella H', 'Лих. ан', '', null, null, null, null, null, null, '', '+/-', '0');
INSERT INTO `analysis` VALUES ('118', 'Лихорадочный антиген', 'Salmonella BH', 'Лих. ан', '', null, null, null, null, null, null, '', '+/-', '0');
INSERT INTO `analysis` VALUES ('119', 'Лихорадочный антиген', 'Salmonella AH', 'Лих. ан', '', null, null, null, null, null, null, '', '+/-', '0');
INSERT INTO `analysis` VALUES ('120', 'Лихорадочный антиген', 'Brucella abortus', 'Лих. ан', '', null, null, null, null, null, null, '', '+/-', '0');
INSERT INTO `analysis` VALUES ('121', 'Лихорадочный антиген', 'Proteus OX 19', 'Лих. ан', '', null, null, null, null, null, null, '', '+/-', '50000');
INSERT INTO `analysis` VALUES ('122', 'Микроэлементы', 'Калий', 'Калий', 'K', '3.55', '5.50', '3.55', '5.50', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('123', 'Микроэлементы', 'Натрий', 'Натрий', 'Na', '135.00', '159.00', '135.00', '159.00', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('124', 'Микроэлементы', 'Кальций', 'Кальций', 'Ca', '2.20', '2.55', '2.20', '2.55', null, null, '', 'mmol/L', '20000');
INSERT INTO `analysis` VALUES ('125', 'Микроэлементы', 'Магний', 'Магний', 'Mg', '0.80', '1.00', '0.80', '1.00', null, null, '', 'mmol/L', '0');
INSERT INTO `analysis` VALUES ('126', 'Микроэлементы', 'Железо', 'Железо', 'Fe', '11.60', '31.30', '7.16', '26.85', null, null, '', 'mkmol/L', '20000');
INSERT INTO `analysis` VALUES ('127', 'Микроэлементы', 'Фосфор', 'Фосфор', 'P', '0.80', '1.61', '0.80', '1.61', '1.29', '2.26', '0-12', 'mmol/L', '15000');
INSERT INTO `analysis` VALUES ('128', 'Микроэлементы', 'Ионизированный кальций', 'Ионизированный кальций', 'I CA', '1.10', '1.40', '1.10', '1.40', null, null, '', 'mmol/L', '15000');
INSERT INTO `analysis` VALUES ('129', 'Микроэлементы', 'Хлор', 'Хлор', 'CL', '98.00', '108.00', '98.00', '108.00', null, null, '', 'mmol/L', '0');
INSERT INTO `analysis` VALUES ('130', 'Аутоимунные заболевания', 'Тканевая трансглутаминаза  IgG', 'Трансглутаминаза', '', '0.00', '10.00', '0.00', '10.00', null, null, '', 'U/ml', '75000');
INSERT INTO `analysis` VALUES ('131', 'Аутоимунные заболевания', 'Кальпротектин', 'Кальпротектин', '', '0.00', '50.00', '0.00', '50.00', '0.00', '50.00', '', 'mkg/g', '150000');
INSERT INTO `analysis` VALUES ('132', 'Аутоимунные заболевания', 'Антитела к топоизомеразе I-Scl-70', 'Scl-70', 'Scl-70', '0.00', '25.00', '0.00', '25.00', '0.00', '25.00', '', 'U/ml', '75000');
INSERT INTO `analysis` VALUES ('133', 'Аутоимунные заболевания', 'Антитела к цитоплазмотическому антигену Jo-1', 'Jo-1', 'Jo-1', '0.00', '25.00', '0.00', '25.00', '0.00', '25.00', '', 'U/ml', '75000');
INSERT INTO `analysis` VALUES ('134', 'Онкомаркеры', 'РЭА', 'РЭА', '', '0.00', '5.00', '0.00', '5.00', null, null, '', 'ng/mL', '35000');
INSERT INTO `analysis` VALUES ('135', 'Онкомаркеры', 'СА-15-3', 'СА-15-3', '', '0.00', '27.00', '0.00', '37.00', null, null, '', 'IU/mL', '35000');
INSERT INTO `analysis` VALUES ('136', 'Онкомаркеры', 'СА-125', 'СА-125', '', '0.00', '35.00', '0.00', '35.00', null, null, '', 'IU/mL', '35000');
INSERT INTO `analysis` VALUES ('137', 'Онкомаркеры', 'ПСА', 'ПСА', '', '0.00', '4.00', '0.00', '0.45', null, null, '0-40', 'ng/mL', '35000');
INSERT INTO `analysis` VALUES ('138', 'Онкомаркеры', 'АФП', 'АФП', '', '0.00', '8.50', '0.00', '8.50', null, null, '', 'ng/mL', '35000');
INSERT INTO `analysis` VALUES ('139', 'Онкомаркеры', 'СА-19-9', 'СА-19-9', '', '0.00', '34.00', '0.00', '34.00', null, null, '', 'Ед/мл', '35000');
INSERT INTO `analysis` VALUES ('140', 'Онкомаркеры', 'ПСА', 'ПСА', '', '0.00', '5.50', '0.00', '0.45', null, null, '40-60', 'ng/mL', '35000');
INSERT INTO `analysis` VALUES ('141', 'Онкомаркеры', 'ПСА', 'ПСА', '', '0.00', '7.00', '0.00', '0.45', null, null, '60-99', 'ng/mL', '35000');
INSERT INTO `analysis` VALUES ('142', 'Общий анализ', 'Общий анализ крови', 'ОАК', '', null, null, null, null, null, null, ' ', ' ', '40000');
INSERT INTO `analysis` VALUES ('143', 'Общий анализ', 'анализ мочи', 'ОАМ', '', null, null, null, null, null, null, '', '', '20000');
INSERT INTO `analysis` VALUES ('144', 'Общий анализ', 'анализ кала', 'ОАКала+ лямблии+прост', '', null, null, null, null, null, null, '', '', '104000');
INSERT INTO `analysis` VALUES ('145', 'Общий анализ', 'Нечипоренко', 'Нечипоренко', '', null, null, null, null, null, null, '', '', '20000');
INSERT INTO `analysis` VALUES ('146', 'Общий анализ', 'общий мазок', 'общий мазок', '', null, null, null, null, null, null, '', '', '20000');
INSERT INTO `analysis` VALUES ('147', 'Общий анализ', 'спермограмма', 'спермограмма', '', null, null, null, null, null, null, '', '', '75000');
INSERT INTO `analysis` VALUES ('148', 'Общий анализ', 'микроальбумин ', 'микроальбумин ', '', null, null, null, null, null, null, '', '', '30000');
INSERT INTO `analysis` VALUES ('149', 'Общий анализ', 'кал на скрытую кровь', 'кал на скрытую кровь', '', null, null, null, null, null, null, '', '', '10');
INSERT INTO `analysis` VALUES ('150', 'Общий анализ', 'сок простаты', 'сок простаты', '', null, null, null, null, null, null, '', '', '10');
INSERT INTO `analysis` VALUES ('151', 'Общий анализ', 'Группа крови', 'Гр.кр', '', null, null, null, null, null, null, '', ' ', '35000');
INSERT INTO `analysis` VALUES ('152', 'Общий анализ', 'Резус фактор', 'Рез.фак', 'Rh', null, null, null, null, null, null, '', '+ / -', '35000');
INSERT INTO `analysis` VALUES ('153', 'Общий анализ', 'Тест на беременность', 'ХГЧ', 'ХГЧ', null, null, null, null, null, null, '', '+ / -', '64000');
INSERT INTO `doctors` VALUES ('1', 'Пулатов Суннатулла Файзуллаевич', 'Узи', '100000', '60000');
INSERT INTO `doctors` VALUES ('2', 'Садыкова Дильдора Тулкуновна', 'Невропатолог', '100000', '60000');
INSERT INTO `doctors` VALUES ('3', 'Кумарина Галина Леонидовна', 'Доцент невропатолог', '100000', '60000');
INSERT INTO `doctors` VALUES ('4', 'Ташпулатов Юнус Равшанович', 'Уролог', '100000', '60000');
INSERT INTO `doctors` VALUES ('5', 'Шеина Елена Александровна', 'Эндокринолог', '100000', '60000');
INSERT INTO `doctors` VALUES ('6', 'Дусаева Руниза Равильевна', 'Гастроэнеролог-нефролог', '100000', '60000');
INSERT INTO `doctors` VALUES ('7', 'Олимов Марат Хурматович', 'Педиатр', '100000', '60000');
INSERT INTO `doctors` VALUES ('8', 'Скосырева Ольга Валентиновна', 'Гастроэнеролог-нефролог', '100000', '60000');
INSERT INTO `doctors` VALUES ('9', 'Гаркуша Мария  Борисовна', 'Педиатр -гастроэнтеролог', '100000', '60000');
INSERT INTO `doctors` VALUES ('10', 'Кац Паина Сиднеевна', 'Гастроэнтеролог', '100000', '60000');
INSERT INTO `doctors` VALUES ('11', 'Арипов Фарход Эркинович', 'Ортопед-травматолог', '100000', '60000');
INSERT INTO `doctors` VALUES ('12', 'Алиева Галина Валентиновна', 'Гинеколог', '100000', '60000');
INSERT INTO `doctors` VALUES ('13', 'Таджиев Хамидулла Кудратович', 'Гинеколог', '100000', '60000');
INSERT INTO `doctors` VALUES ('14', 'Гончарова Элеонора Геннадьевна', 'Офтальмолог', '100000', '60000');
INSERT INTO `doctors` VALUES ('15', 'Алимбекова Диля Равильевна', 'Лор', '100000', '60000');
INSERT INTO `doctors` VALUES ('16', 'Донияр-Ходжаева Виктория Михайловна', 'Гастроскопия', '70000', null);
INSERT INTO `doctors` VALUES ('17', 'Донияр-Ходжаева Виктория Михайловна', 'Колонофиброскопия', '80000', null);
INSERT INTO `patients` VALUES ('1', '1', '10-12-2020', 'Фамилия', 'Имя', 'Отчество', 'мужской', '1915', '', null, '110;109;108;107;106;105;', '12;20;2.5;15;90;1;', null, '2020-12-10');
INSERT INTO `patients` VALUES ('2', '2', '10-12-2020', 'Фамилия', 'Имя', 'Отчество', 'женский', '1990', '', null, '90;27;64;65;40;41;39;94;', '10;0.12;5;5;1;2.2;5.3;56;', null, '2020-12-10');
INSERT INTO `patients` VALUES ('3', '3', '10-12-2020', 'Фамилия', 'Имя', null, 'мужской', '1990', '3', '100000', '30;31;138;67;107;', ';;;;;', null, null);
INSERT INTO `patients` VALUES ('4', '4', '10-12-2020', 'Фамилия', 'И', null, 'мужской', '1990', '5', null, '3;', ';', null, null);
