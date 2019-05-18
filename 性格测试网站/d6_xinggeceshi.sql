/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : d6_xinggeceshi

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 14/05/2019 20:54:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `imageFile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (1, '2019-04-07', '<p>九型人格学（Enneagram/Ninehouse）是一个有2000多年历史的古老学问，它按照人们习惯性的思维模式，情绪反应和行为习惯等性格特质，将人的性格分为九种——1号性格：完美主义者; 2号性格：给予者 ;3号性格：实干者 ;4号性格：悲情浪漫者 ;5号性格：观察者 ;6号性格：怀疑论者 ;7号性格：享乐主义者 ;8号性格：保护者 ;9号性格：调停者 。</p>               <table width=\"290\" cellspacing=\"5\"><tbody><tr><td><img alt=\"\" style=\"border: 0px solid #333333;\" src=\"http://www.apesk.com/mensa/img/ninehouse.jpg\" width=\"290\" align=\"middle\" /></td></tr><tr><td>&nbsp;</td></tr></tbody></table><p>“Enneagram”一词源自希腊文ennea(九)以及gram(型态)，可以译为<strong>九宫格（ninehouse）</strong>、九型人格或九种性格。九型人格是2000多年前印度西部研究出的人性学，后来由苏非学派所传承。</p><p>其后，九型人格学说辗转流传到欧美等地，美国心理学家海伦·帕玛（Helen Palmer）早年将它用作研究人类行为及心理的专业课题，更被包括斯坦福大学在内的多所美国大学列作教材，成为心理研究课程。美国中央情报局（CIA）亦曾使用它，协助探员了解各国元首的行为特质。 世界500强中的美国通用汽车公司、可口可乐、惠普等企业也早已把九型人格学运用于企业管理。</p><p>为方便我们的理解，我们把九种性格直观列出如下：</p>  <p>第一型完美主义者（The Reformer）：完美者、改进型、捍卫原则型、秩序大使</p><p>第二型助人者（The Helper）：成就他人者、助人型、博爱型、爱心大使</p><p>第三型成就者（The Achiever）：成就者、实践型、实干型</p><p>第四型艺术型（The Individualist）：浪漫者、艺术型、自我型</p><p>第五型智慧型（The Investigator）：观察者、思考型、理智型</p><p>第六型忠诚型（The Loyalist）：寻求安全者、谨慎型、忠诚型</p><p>第七型快乐主义型（The Enthusiast）：创造可能者、活跃型、享乐型</p><p>第八型领袖型（The Challenger）：挑战者、权威型、领袖</p><p>第九型和平型（The Peacemaker）：维持和谐者、和谐型、平淡型</p>', '2019040706582462592.jpg', '九型人格学（Enneagram/Ninehouse）是一个有2000多年历史的古老学问，它按照人们习惯性的思维模式，情绪反应和行为习惯等性格特质，将人的性格分为九种——1号性格：完美主义者; 2号性格：给予者 ;3号性格：实干者 ;4号性格：悲情浪漫者 ;5号性格：观察者 ;6号性格：怀疑论者 ;7号性格：享乐主义者 ;8号性格：保护者 ;9号性格：调停者 。', '九型人格（Ninehouse）完整版测试', NULL);

-- ----------------------------
-- Table structure for t_personality
-- ----------------------------
DROP TABLE IF EXISTS `t_personality`;
CREATE TABLE `t_personality`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `maxScore` int(11) NULL DEFAULT NULL,
  `minScore` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_personality
-- ----------------------------
INSERT INTO `t_personality` VALUES (1, '完美型', 'A.觉得凡事都应该有规有矩，我一直坚持自己的标准。B.我理性正直、做事有原则、有条理、有效率、事事力求完美，但别人说我过于挑剔、吹毛求疵。C.经常说的话：“应该这样，不应该这样”1.特质\r\n\r\nA.一丝不苟、一本正经、不苟言笑、严肃、严谨、爱批评、不怒自威、理性、不讲情面，整洁、挑剔、做事情前需要充分准备、完美主义、守时、有计划有目标、要求过高；B.做事情有原则：世界是黑白分明的，没有灰色地带，对是对，错是错，做人一定要公正，有节制，做事一定要有效率；C.现实、实用主义者、不满现状、压抑愤怒、负责任、有道德优越感、正直、严于律己、同时也严于律人、不喜欢别人说他、对别人的批评会耿耿于怀，同时也会去改正自己的缺点，自我批判、追求高度自律他律。2.特征\r\n\r\nA.我有我的标准：我公平正直，计究原则，做事严谨认真，有条有理，井然有序，同时力求完美，但别人却说我吹毛求疵，爱挑毛病；B.基本恐惧：怕自己错、变坏、被腐蚀；C.基本欲望：希望自己是对的，好的，贞洁的，有诚信的；D.顺境时：正直踏实，能包容他人，能打破条条框框，处事有一定弹 性，叛断力强，聪慧而理性，重视公平与诚实，大胆挑战不公平的现象，凡事依据原则而行，有理智，能自律与节制，有很高的道德标准；E.逆境时：挑剔、心胸 狭窄、不肯接纳别人的意见，容易把别人的意见视为不善意的抨击，不接受自己处事极端呆板，教条主义，绝对化，缺乏弹性，爱否定打击别人。作为领导，你要倾听他的意见、注意他的态度，鼓励他往正面看。3.适合工作\r\n\r\n财务、监察、审计、品质管理等\r\n\r\n4.典型人物\r\n\r\n朱镕基、包公、郭靖、张瑞敏…\r\n\r\n5.典型价值观\r\n\r\n追求卓越，没有最好只有更好、细节决定成败、鞠躬尽瘁；\r\n\r\n6.名人名言\r\n\r\n朱熔基:“不管前面是地雷阵还是万丈深渊，我都将勇往直前，义无反顾，鞠躬尽瘁，死而后已。”', 118, 1);
INSERT INTO `t_personality` VALUES (2, '全爱型', 'A.乐于付出（随时随地帮人，动机单纯）、善解人意、容易与人相处；B.总是热情地去满足他人的需要，别人容易与我倾述心事；C.也渴望得到爱与关怀，可别人却常常忽略我。1.特质\r\n\r\nA.毫不利己、专门利人；喜欢帮助别人，不懂得拒绝别人；B.忽视自己，重视别人，心肠好、人缘好，喜欢被别人依赖而获得成就感；C.感性、天生的同理心，乐于助人、主动、取悦人，时常感觉自己付出的不够，取悦人；D.相信别人胜过相信自己的家人、强调别人需求，忽略自己的需求，对家人不关心，做他的家人就比较痛苦；E.做自己家的事懒惰，为别人家干活很勤快；F.甘于牺牲、有感情帐簿、对爱的极度需求；G.戏剧化（吸引注意），拒绝别人帮助（漂亮，随便长的）；H.语气柔和，喜欢与人身体接触，关注人，不关注事情。2.特征\r\n\r\nA.我要帮助所有的人：我富有爱心，善解人意，热情付出，总是优先帮助他人的需求，可别人却常常忽略我的存在；B.基本恐惧：不被爱，不被需要；C.基本欲望：感受爱的存在；D.顺境时：慷慨无私，富有很强的同情心，体谅他人，热心助人，主动付出，热情而有活力，充满阳光气息，诚恳而温暖，容易接近，很受人欢迎；E.逆境时：情绪化、虚荣心重、操控别人、讨好别人、觉得自己特殊、专制而易怒、爱抱怨、因觉得自己的付出与收获不成正比而扮演受害者。主要动机：被爱、被需要、希望别人喜欢他多于尊重，成就他人，追求情感上的满足。2号容易把焦点放在人身上，要避免用激烈的口吻。3.适合工作\r\n\r\n秘书、社工、服务工作等。\r\n\r\n4.典型人物\r\n\r\n牛根生、雷锋…\r\n\r\n5.典型价值观\r\n\r\n财散人聚，财聚人散，先付出,再得到。', 128, 119);
INSERT INTO `t_personality` VALUES (3, '成就型', '相信天下没有不可能的事，我渴望事业有成就，希望被人肯定、接受、受人注意和羡慕，他们都说我急性子、爱比较，因为过度追求一个又一个目标而让我变成了“工作狂”。1.特质\r\n\r\nA.目标和结果比过程更重要,为达到目的不择手段；B.随时随地改变外在，高能量、能言善道；C.重视名利，是个现实主义者，做事愿意走捷径，有极强的行动力，为达成目标会想尽任何的可能性做事一定要赢；D.不服输、做事灵巧，自信心强、聪明，喜爱支配，竞争心强；E.卖弄自己才华、喜欢比较，虚荣心强、爱表现自己，炫耀自己；F.重视形象，喜欢被别人夸奖；G.喜欢出头,在意自己在别人面前的表现，让人看到最好的一面，喜欢成为众人的焦点。2.特点\r\n\r\nA.我要出人头地：我追求个人成就，渴望比他人更成功，喜欢成为别人关注的焦点，希望被人尊重、肯定和羡慕、很多人却说我是“工作狂”；B.基本恐惧：没有成就，一事无成；C.基本欲望：感觉有价值，被接受；D.顺境时：精明能干，充满活力，自信而有魅力，愿意自我肯定内在的价值，乐观主动，感染力强，外向，行动敏捷，不断进取，成就出众，有“不到黄河心不死”的韧性，是富有同情心的领袖；E.逆境时：工于心计，为达目的不择手段，会期骗与说谎，妒忌心强，踩踏别人抬高自己，会剥削和利用他人，把他人当成成功的垫脚石，自恋与残暴。3.适合工作\r\n\r\n销售、公关等。\r\n\r\n4.典型人物\r\n\r\n刘德华、章子怡、巩俐、江南春、王石…\r\n\r\n5.典型价值观\r\n\r\n超越他人、超越自我、简单的事情重复做、快鱼吃慢鱼、财富是我能力的证明\r\n\r\n6.名人名言\r\n\r\n拉里·埃里森:“我并没有说要成为世界第一，我只是想超越在我前面的盖茨而已。”', 138, 129);
INSERT INTO `t_personality` VALUES (4, '艺术型', 'A.时常觉得自己独特与别人不同，我很容易情绪化，情感世界较一般人丰富得多及充满幻想，又有时觉得自己有缺憾及不足；B.我渴望别人多些了解我的内心感受，但总是苦恼于这个世界真的没有人能真正明白我。1.特质\r\n\r\nA.讲究个性，渴望与众不同；有艺术才华；B.我行我素，有深度，有品位；C.敏感、容易情绪化，嫉妒、爱幻想，创作力强；D.容易沉浸在自我世界,浪漫、感性,不了解人情世故,占有欲强；E.喜欢通过有美感的事物去表达个人感情，内向，抽离，忧郁，追求独特的感觉；F.恐惧平淡，被遗弃，对人若即若离；G.寻求拯救者，一个了解他们，并且支持他们梦想的人。2.特征\r\n\r\nA.我是独一无二的，我注重感觉、敏感而多梦，我渴望别人能够了解我的内心感受，注意到我的独特与恐惧之处，但是这个世界好像没有人能够真正明白我；B.基本恐惧：没有独特的自我认同或找不到存在意义；C.基本欲望：寻找自我，在内在经验中找到自我认同；D.顺境时：灵感不断、富有创造力、感情真挚而坦诚、观人细微、给于别人贴身的支持、感恩、自我认同、观察力强、直觉、敏感、肯定自我并表现自我、有幽默感、愿意承担；E.逆境时：忧郁、多愁善感、自怜自爱、自我怀疑、自我破坏、对世界充满不信任的感觉、远离人群、爱回忆过去、依附于痛苦等负面情绪中对难以自拔。3.适合工作\r\n\r\n设计、创作等需要创意的工作。\r\n\r\n4.典型人物\r\n\r\n王菲、张国荣、亚里斯多德…\r\n\r\n5.典型价值观\r\n\r\n创意与灵感、追求独特、品位超群\r\n\r\n6.名人名言\r\n\r\n亚里斯多德：“忧郁的男人是最富有才气的。”', 148, 139);
INSERT INTO `t_personality` VALUES (5, '理智型', 'A.总是喜欢思考，追求知识，渴望比别人知的多、懂的多，了解周遭一切事物的原理、结构、因果以至宏观全局。我觉得做人要有深度；B.由于我不爱说好听的话，身边人总是说我“不懂人情世故”。1.特质\r\n\r\nA.思想的巨人，行动的矮子，忘我工作；B.讨厌情绪激动的人，不喜欢喧闹，喜欢独处；C.与现实脱节，抽离，不喜欢群体运作；D.希望了解事情的全部，而不是部分；E.分析和逻辑思维能力特别强,容易把复杂的事情分解,重视精神享受，不重视物质享受；F.做事情不喜欢被别人打扰，喜欢分析事物及探讨抽象的观念从而建立理论架构，百分百用脑做人，刻意表现深度保护隐私。G.不重外表但注重内涵，喜欢被动，不喜欢主动，基本生活技能较弱。2.特征\r\n\r\nA.我要了解世界：我总是喜欢分析、思考、追求知识、渴望比别人懂得更多、我不善表达内心感受，给人缺乏感情的印象，由于不善于交际应酬，身边人总说我“不懂人情世故”；B.基本恐惧：无助、无能、无知；C.基本欲望：能干、知识丰富；D.顺境时：聪明、有卓越的观察力与分析能力、见解独到而深刻、能专注于某一领域、博学而专精、办事仔细无遗、好学、求知欲强、有独创与革新精神；E.逆境时：逃避、愤世嫉俗、充满敌意、妄想、孤独、狂躁、自我封闭、把自己困于某些思维模式中，有破坏别人及自己的倾向。3.适合工作\r\n\r\n策划、整合、管理、研究工作。\r\n\r\n4.典型人物\r\n\r\n培根、李敖、马克思…\r\n\r\n5.典型价值观\r\n\r\n科学管理、学无止境\r\n\r\n6.名人名言\r\n\r\n培根：“知识就是力量”。', 158, 149);
INSERT INTO `t_personality` VALUES (6, '忠诚型', 'A.为人忠心耿耿，但却多疑过虑，内心深处常有担心和不安，安全方面我总是想的太多，常因此拖延；B.我时常怀疑自己的能力，无论做得多好，也需要别人的肯定方能安心。1.特质\r\n\r\nA.始终和别人保持一定的距离；做事总是许多担心，恐惧犯错，过分谨慎；B.凡事做最坏的打算，防卫性强，缺乏安全感，怀疑而非明显的恐惧；C.相信权威、需要团队，凡事有周详的计划；D.勤奋，逆商很高，人称打不死，有责任感，可靠；E.有责任感，重承诺，不喜欢受人注目，老二心态。2.特征\r\n\r\nA.我很小心谨慎，我为人忠诚，但却太多疑虑，我总觉得世界充满危机，内心深处常有担心、焦虑，我过于考虑安全方面，常常因此延迟采取行动；B.基本恐惧：得不到支持及引导，单凭一已的能力没法生存；C.基本欲望：得到支持及安全感；D.顺境时：有亲和力、忠诚可靠、肯支援团队、有责任心、勤奋、值得信赖、有良好的合作精神，相信自己和他人，懂得享受生命、踏实、平和；E.逆境时：焦虑、紧张、缺乏自信、极度缺乏安全感，到处寻找安全感，对刺激过度反应，自我打击，有被虐倾向。3.适合工作\r\n\r\n建立系统、设立防范机制、顾问等工作。\r\n\r\n4.典型人物\r\n\r\n张学友、曹操…\r\n\r\n5.典型价值观\r\n\r\n置之死地而后生、从最坏处着眼、凡事预则立、务实稳健\r\n\r\n6.名人名言\r\n\r\n比利（前世界球王）：“最佳的防守，就是进攻。”', 168, 159);
INSERT INTO `t_personality` VALUES (7, '活跃型', 'A.喜欢“新鲜好玩、自由自在、开心快乐”的生活；B.讨厌重复沉闷的事情或空闲时间。1.特质\r\n\r\nA.当察觉压迫感来临时，我通常以活动来逃避，不愿面对；B.坦率自信，朋友众多，聪明，乐天派；C.多才多艺，兴趣广泛，理想主义者，喜欢探索新鲜事物深知自我娱乐之道；D.不能吃苦、花心，精力充沛、怕束缚，天生热爱自由，讨厌规则，等级观念淡薄；E.不够坚持，做事缺少耐心，逆商不高，过程很重要，结果不重要；F.精力充沛，贪食、惰性、不知足，及时行乐、自我为中心很少顾及他人感受，反叛；G.目标不清晰，无承诺感，大话西游。2.特点\r\n\r\nA.我是快乐的：我天生开心、贪玩、喜欢新奇的事物、我追求自由存在，率性而为的生活、但总有些不得不处理的事情占有我的娱乐时间；B.基本恐惧：被剥削、被困于痛苦中；C.基本欲望：追求快乐、满足、得偿如愿；D.顺境时：充满欢乐、乐观豁达、热心而宽容、有想像力与创造力、精神充沛、多才多艺、具有鉴赏力、为人群带来欢乐、令人觉得生命充满希望；E.逆境时：不切实际、经常妄想、能够以小搏大、冲动、有功击性、爱出风头、有时和为失控、夸张炫耀、于逸乐中逃避现实。3.适合工作\r\n\r\n创作、娱乐工作。\r\n\r\n4.典型人物\r\n\r\n周伯通、傻根、洪七公、曾志伟…\r\n\r\n5.典型价值观\r\n\r\n创新是第一生产力、快乐工作、快乐生活\r\n\r\n6.名人名言\r\n\r\n华特·迪士尼：“这个世界之所以美好，是我们可以选择快乐。”', 178, 169);
INSERT INTO `t_personality` VALUES (8, '领袖型', 'A.对人直截了当，有正义感，他人喜欢我与否，决不重要，重要的是他们尊重我和敬畏我；B.喜欢带领并保护身边的人，但别人却不领我的情，反而认为我太过“专横”而疏远我。1.特质\r\n\r\nA.霸道，喜欢控制大局，喜欢有很多人追随他；B.遇到问题立刻解决，脾气暴躁，不懂温柔，但在家里可以表现的和善；C.彻底的自由主义者，敢冒险，是掌舵人、创业者、固执、支配性，热情助人；D.遇强则强，遇弱则弱；E.以自己的方式行事，感觉迟钝，忽略他人的感受；激励别人，决不拖泥带水；F.对人防卫性强，不让人接近，强化外壳，防止受伤。2.特征\r\n\r\nA.我是百折不挠的，我刚强自信，有正义感，勇于承担，我喜欢带领并保护身边的人，但是别人却经常觉得我太过于“霸到”而与我保持距离；B.基本恐惧：被认为软弱，被人伤害，控制，侵犯；C.基本欲望：决定自己在生命中的方向，捍卫本身的利益，做强者；D.顺境时：充满正义感，主持公道，保护他人，勇于承担，宽宏大量，自信坚定，行动力强，能领导他人，坚强，有决断力；E.逆境时：手段强硬，独裁而充满暴力，要求别人牺牲小我去成就他的大我，喜欢追求权力，我行我素，冷漠、夸大、报复心重。3.适合工作\r\n\r\n管理者，领导者。\r\n\r\n4.典型人物\r\n\r\n李小龙、毛泽东…\r\n\r\n5.典型价值观\r\n\r\n追求一统江湖、唯有牺牲多壮志、敢叫日月换新\r\n\r\n6.名人名言\r\n\r\n李小龙：“中国人，不是东亚病夫！”', 188, 179);
INSERT INTO `t_personality` VALUES (9, '和平型', 'A.是一个平和的人，相信“忍一时风平浪静，退一步海阔天空”，对人决不苛求，凡事随遇而安；B.我怕冲突，容易退缩让步，万事以和为贵，有时会委屈自己；C.渴望人人能和平相处，可别人却说我“优柔寡断”。1.特质\r\n\r\nA.不爱做决定，别人说什么他都说好；B.谁也不得罪，也不轻易给别人建议；C.生活的润滑剂，聆听者，甘于现实，不求调整，为人被动；D.对生命表现得不甚热衷，自我意识弱，常将专注力放在别人身上；E.依附自动化习惯，容易分散注意力；F.有颇强烈的宿命论，因此一切听天由命；G.强调别人处境的优势，逃避面对问题以及面对自己，过度适应；H.遇到问题逃避，越老脾气越坏。2.特征\r\n\r\nA.我宁愿息事宁人：我待人友善，喜欢和谐的氛围，希望大家和睦相处，可别人却说我太过好，好先生，优柔寡断，没有立场；B.基本恐惧：失去、分离、被歼灭；C.基本欲望：维系内在的平静和安稳；D.顺境时：有童心，对人和善，慷慨大度，心平益和，纯真而富有耐心，支持他人，轻松温和，有同情心，勇于实践；E.逆境时：抱怨，麻木不仁，将事情过分合理化，懒惰拖延，没有行动力，缺乏焦点，迷茫。3.适合工作\r\n\r\n人事，调研，仲裁。\r\n\r\n4.典型人物\r\n\r\n周恩来、里根、甘地…', 300, 189);

-- ----------------------------
-- Table structure for t_qu
-- ----------------------------
DROP TABLE IF EXISTS `t_qu`;
CREATE TABLE `t_qu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgFile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_qu
-- ----------------------------
INSERT INTO `t_qu` VALUES (1, '2019051408382242240.jpg', '测一测你还有多久能脱单？ ');
INSERT INTO `t_qu` VALUES (2, '2019051408493681539.jpeg', '测一测你到底有多污！ ');
INSERT INTO `t_qu` VALUES (3, '2019051408495564059.jpeg', '你的数学天赋是什么型？ ');
INSERT INTO `t_qu` VALUES (4, '2019051408500881312.jpg', '你的脸盲程度有多高？ ');
INSERT INTO `t_qu` VALUES (5, '2019051408501955881.jpg', '测测你的直男程度有多高？ ');
INSERT INTO `t_qu` VALUES (6, '2019051408503065310.jpg', '开放程度测试 ');
INSERT INTO `t_qu` VALUES (7, '2019051408504463280.jpeg', '测试你隐形性格是什么样子 ');
INSERT INTO `t_qu` VALUES (8, '2019051408505733027.jpeg', '你是一个花心的女人吗？ ');

-- ----------------------------
-- Table structure for t_qu_item
-- ----------------------------
DROP TABLE IF EXISTS `t_qu_item`;
CREATE TABLE `t_qu_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score1` int(11) NOT NULL,
  `score2` int(11) NOT NULL,
  `score3` int(11) NOT NULL,
  `score4` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKE2454F832A7EFA2A`(`qu_id`) USING BTREE,
  CONSTRAINT `FKE2454F832A7EFA2A` FOREIGN KEY (`qu_id`) REFERENCES `t_qu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_qu_item
-- ----------------------------
INSERT INTO `t_qu_item` VALUES (1, '抚弄头发', '玩弄手腕', '眼神迷离', '以上行为都是', 1, 2, 3, 4, '当男生同女生在一起交谈时，女生下列哪一个行为表示她对男生有兴趣？', 1);
INSERT INTO `t_qu_item` VALUES (2, '喜剧片', '文艺片', '恐怖片', '纪录片', 1, 2, 3, 4, '男生想要和女生感情更进一步，带女生去看哪种类型的电影效果更好？', 1);
INSERT INTO `t_qu_item` VALUES (3, '遭受挫折时', '春风得意时', '怜悯对方时', '以上都是', 3, 2, 3, 4, '人在下列哪种情形下容易产生爱与被爱的行为？', 1);
INSERT INTO `t_qu_item` VALUES (4, '我爱你', '我想你', '我要你', '我恨你', 3, 2, 3, 4, '  若有人发给你如下信息  F3:F7，G7，I3:I7，J3，J7，K3:K7，M3:M6，N7，O3:O6，Q3:Q7，R3:S3，R5，R7:S7  请问这代表了什么？', 1);
INSERT INTO `t_qu_item` VALUES (5, 'LIKE', 'LOVE', 'NEED', 'HELP', 3, 2, 3, 4, '暗恋对象给你发来了四个数字“8023”，请问ta想对你说什么？', 1);
INSERT INTO `t_qu_item` VALUES (6, '今天你要嫁给我', '我每天都在想你', '你就是我的唯一', '我爱你一生一世', 3, 2, 3, 4, '程序猿说：10011110101110110100010  请问这代表什么意思？', 1);
INSERT INTO `t_qu_item` VALUES (7, '我很喜欢你', '我想念着你', '我深爱着你', '我会祝福你', 3, 2, 3, 4, '化学家说：Os As At Ge Nb  请问这代表什么意思？', 1);

-- ----------------------------
-- Table structure for t_qu_score
-- ----------------------------
DROP TABLE IF EXISTS `t_qu_score`;
CREATE TABLE `t_qu_score`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxscore` int(11) NOT NULL,
  `minscore` int(11) NOT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `qu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK66E9F8222A7EFA2A`(`qu_id`) USING BTREE,
  CONSTRAINT `FK66E9F8222A7EFA2A` FOREIGN KEY (`qu_id`) REFERENCES `t_qu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_qu_score
-- ----------------------------
INSERT INTO `t_qu_score` VALUES (1, 10, 0, '注定那啥了', 1);
INSERT INTO `t_qu_score` VALUES (2, 100, 10, '差不多要步入牢笼了', 1);

-- ----------------------------
-- Table structure for t_ques
-- ----------------------------
DROP TABLE IF EXISTS `t_ques`;
CREATE TABLE `t_ques`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  `checkType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKCB6202BD2E6AC35C`(`type_id`) USING BTREE,
  CONSTRAINT `FKCB6202BD2E6AC35C` FOREIGN KEY (`type_id`) REFERENCES `t_ques_type` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_ques
-- ----------------------------
INSERT INTO `t_ques` VALUES (13, '我觉得许多人倚赖我的帮忙和慷慨', 13, '单选');
INSERT INTO `t_ques` VALUES (14, '我很努力纠正自己的缺失。', 13, '单选');
INSERT INTO `t_ques` VALUES (15, '我是一个不断朝向目标生活的外向人。', 13, '单选');
INSERT INTO `t_ques` VALUES (16, '我认為大多数人都不懂得欣赏生命的内在美。 ', 13, '单选');
INSERT INTO `t_ques` VALUES (17, '我倾向於隐藏自己的感情，是个多接受少付出的人。', 13, '单选');
INSERT INTO `t_ques` VALUES (18, '我是一个彻头彻尾、站在路中心的人，我最大的敌人是自己的恐惧。', 13, '单选');
INSERT INTO `t_ques` VALUES (19, '我喜欢让事情呈现得轻鬆、幽默。 ', 13, '单选');
INSERT INTO `t_ques` VALUES (20, '我是个易於满足的人，极少感到忧虑，几乎常是心平气和的。 ', 13, '单选');
INSERT INTO `t_ques` VALUES (23, '我很善於挺身而出，為自己的需要争持到底。 ', 13, '单选');
INSERT INTO `t_ques` VALUES (24, '我很容易察觉别人的弱点，假如我遇到不公平的待遇，我会攻击这弱点。 ', 14, '单选');
INSERT INTO `t_ques` VALUES (25, '我觉得生命中许多事情不值得人為它过份操劳而情绪低落。', 14, '单选');
INSERT INTO `t_ques` VALUES (26, '对现存的总觉不满。 ', 14, '单选');
INSERT INTO `t_ques` VALUES (27, '我感到有些時候自己像是一個被流放的貴族。', 17, '单选');

-- ----------------------------
-- Table structure for t_ques_item
-- ----------------------------
DROP TABLE IF EXISTS `t_ques_item`;
CREATE TABLE `t_ques_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ques_id` int(11) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKB37F5F558702376A`(`ques_id`) USING BTREE,
  CONSTRAINT `FKB37F5F558702376A` FOREIGN KEY (`ques_id`) REFERENCES `t_ques` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_ques_item
-- ----------------------------
INSERT INTO `t_ques_item` VALUES (60, '是', 13, 1);
INSERT INTO `t_ques_item` VALUES (61, '否', 13, 2);
INSERT INTO `t_ques_item` VALUES (62, '是', 14, 1);
INSERT INTO `t_ques_item` VALUES (63, '否', 14, 2);
INSERT INTO `t_ques_item` VALUES (64, '是', 15, 1);
INSERT INTO `t_ques_item` VALUES (65, '否', 15, 2);
INSERT INTO `t_ques_item` VALUES (66, '是', 16, 1);
INSERT INTO `t_ques_item` VALUES (67, '否', 16, 2);
INSERT INTO `t_ques_item` VALUES (68, '是', 17, 1);
INSERT INTO `t_ques_item` VALUES (69, '否', 17, 2);
INSERT INTO `t_ques_item` VALUES (70, '是', 18, 1);
INSERT INTO `t_ques_item` VALUES (71, '否', 18, 2);
INSERT INTO `t_ques_item` VALUES (72, '是', 19, 1);
INSERT INTO `t_ques_item` VALUES (73, '否', 19, 2);
INSERT INTO `t_ques_item` VALUES (74, '是', 20, 1);
INSERT INTO `t_ques_item` VALUES (75, '否', 20, 2);
INSERT INTO `t_ques_item` VALUES (80, '是', 23, 1);
INSERT INTO `t_ques_item` VALUES (81, '否', 23, 2);
INSERT INTO `t_ques_item` VALUES (82, '是', 24, 1);
INSERT INTO `t_ques_item` VALUES (83, '否', 24, 2);
INSERT INTO `t_ques_item` VALUES (84, '是', 25, 1);
INSERT INTO `t_ques_item` VALUES (85, '否', 25, 2);
INSERT INTO `t_ques_item` VALUES (86, '是', 26, 1);
INSERT INTO `t_ques_item` VALUES (87, '否', 26, 2);
INSERT INTO `t_ques_item` VALUES (88, '是', 27, 1);
INSERT INTO `t_ques_item` VALUES (89, '否', 27, 2);

-- ----------------------------
-- Table structure for t_ques_type
-- ----------------------------
DROP TABLE IF EXISTS `t_ques_type`;
CREATE TABLE `t_ques_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vote_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `FKB384737CE921181F`(`vote_type_id`) USING BTREE,
  CONSTRAINT `FKB384737CE921181F` FOREIGN KEY (`vote_type_id`) REFERENCES `t_vote_type` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_ques_type
-- ----------------------------
INSERT INTO `t_ques_type` VALUES (13, '12组108题 第一组', 'WJ0013', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (14, '12组108题 第二组', 'WJ0014', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (15, '12组108题 第三组', 'WJ0015', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (16, '12组108题 第四组', 'WJ0016', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (17, '12组108题 第五组', 'WJ0017', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (18, '12组108题 第六组', 'WJ0018', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (19, '12组108题 第七组', 'WJ0019', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (20, '12组108题 第八组', 'WJ0020', '问卷', 9);
INSERT INTO `t_ques_type` VALUES (21, '12组108题 第九组', 'WJ0021', '问卷', 9);

-- ----------------------------
-- Table structure for t_simpleuser
-- ----------------------------
DROP TABLE IF EXISTS `t_simpleuser`;
CREATE TABLE `t_simpleuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK6818392878313856`(`userID`) USING BTREE,
  CONSTRAINT `FK6818392878313856` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_simpleuser
-- ----------------------------
INSERT INTO `t_simpleuser` VALUES (1, 2);
INSERT INTO `t_simpleuser` VALUES (2, 3);
INSERT INTO `t_simpleuser` VALUES (3, 4);

-- ----------------------------
-- Table structure for t_sysuser
-- ----------------------------
DROP TABLE IF EXISTS `t_sysuser`;
CREATE TABLE `t_sysuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK54046F4D78313856`(`userID`) USING BTREE,
  CONSTRAINT `FK54046F4D78313856` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sysuser
-- ----------------------------
INSERT INTO `t_sysuser` VALUES (1, 1);

-- ----------------------------
-- Table structure for t_transform
-- ----------------------------
DROP TABLE IF EXISTS `t_transform`;
CREATE TABLE `t_transform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p1_id` int(11) NULL DEFAULT NULL,
  `p2_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK5DA06561100EA236`(`p2_id`) USING BTREE,
  INDEX `FK5DA06561100E2DD7`(`p1_id`) USING BTREE,
  CONSTRAINT `FK5DA06561100E2DD7` FOREIGN KEY (`p1_id`) REFERENCES `t_personality` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK5DA06561100EA236` FOREIGN KEY (`p2_id`) REFERENCES `t_personality` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_transform
-- ----------------------------
INSERT INTO `t_transform` VALUES (1, '注定孤独一身', 1, 9);
INSERT INTO `t_transform` VALUES (2, '注定孤独一身00000000000', 1, 2);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userBirth` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userGender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPassword` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE,
  UNIQUE INDEX `userID`(`userID`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', NULL, NULL, NULL, '1', '管理员', 'E10ADC3949BA59ABBE56E057F20F883E', NULL);
INSERT INTO `t_user` VALUES (2, 'user1', '', NULL, '', '0', '茉莉', 'E10ADC3949BA59ABBE56E057F20F883E', '');
INSERT INTO `t_user` VALUES (3, 'user2', '', '', '121211@fdsfs.com', '0', '玫瑰', 'E10ADC3949BA59ABBE56E057F20F883E', '21212');
INSERT INTO `t_user` VALUES (4, 'user3', '', NULL, '', '1', '霸王龙', 'E10ADC3949BA59ABBE56E057F20F883E', '');

-- ----------------------------
-- Table structure for t_user_result
-- ----------------------------
DROP TABLE IF EXISTS `t_user_result`;
CREATE TABLE `t_user_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(11) NOT NULL,
  `personality_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKE2D25FC64CD8960A`(`personality_id`) USING BTREE,
  INDEX `FKE2D25FC6B5505151`(`user_id`) USING BTREE,
  CONSTRAINT `FKE2D25FC64CD8960A` FOREIGN KEY (`personality_id`) REFERENCES `t_personality` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FKE2D25FC6B5505151` FOREIGN KEY (`user_id`) REFERENCES `t_simpleuser` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_result
-- ----------------------------
INSERT INTO `t_user_result` VALUES (7, '2019-04-09', 26, 1, 1);

-- ----------------------------
-- Table structure for t_vote_type
-- ----------------------------
DROP TABLE IF EXISTS `t_vote_type`;
CREATE TABLE `t_vote_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_vote_type
-- ----------------------------
INSERT INTO `t_vote_type` VALUES (9, '人格测试12组108题');

SET FOREIGN_KEY_CHECKS = 1;
