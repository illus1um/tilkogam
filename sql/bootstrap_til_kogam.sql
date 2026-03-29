-- Bootstrap script for journal_id=1
-- Journal: "ТІЛ ЖӘНЕ ҚОҒАМ" / "TIL ZHANE KOGAM"
-- Target: OJS 3.4.x

SET NAMES utf8mb4;

-- -----------------------------
-- Core journal identity
-- -----------------------------
UPDATE journals
SET
  primary_locale = 'kk'
WHERE journal_id = 1;

INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value)
VALUES
  (1, 'kk', 'name', 'ТІЛ ЖӘНЕ ҚОҒАМ'),
  (1, 'ru', 'name', 'ТІЛ ЖӘНЕ ҚОҒАМ (Язык и общество)'),
  (1, 'en', 'name', 'TIL ZHANE KOGAM'),

  (1, 'kk', 'acronym', 'ТЖҚ'),
  (1, 'ru', 'acronym', 'ТЖҚ'),
  (1, 'en', 'acronym', 'TZK'),

  (1, 'kk', 'description', '«ТІЛ ЖӘНЕ ҚОҒАМ» — халықаралық ғылыми электрондық журнал. Негізгі бағыттары: лингвистика және жасанды интеллект, терминология, тіл оқыту әдістемесі.'),
  (1, 'ru', 'description', '«ТІЛ ЖӘНЕ ҚОҒАМ» — международный научный электронный журнал. Основные направления: лингвистика и искусственный интеллект, терминология, методика преподавания языков.'),
  (1, 'en', 'description', 'TIL ZHANE KOGAM is an international scientific electronic journal focused on linguistics and artificial intelligence, terminology, and language teaching methodology.'),

  (1, 'kk', 'about', '<h3>Журнал туралы</h3><p>«ТІЛ ЖӘНЕ ҚОҒАМ» — халықаралық ғылыми электрондық журнал.</p><p>Құрылтайшы: Қазақстан Республикасы Ғылым және жоғары білім министрлігінің Тіл саясаты комитеті.</p><p>Шығу жиілігі: жылына 4 рет.</p><p>Жариялау тілдері: қазақ, орыс, ағылшын.</p><h3>Тақырыптық бағыттар</h3><ul><li>Лингвистика және жасанды интеллект</li><li>Терминология</li><li>Тіл оқыту әдістемесі</li></ul>'),
  (1, 'ru', 'about', '<h3>О журнале</h3><p>«ТІЛ ЖӘНЕ ҚОҒАМ» — международный научный электронный журнал.</p><p>Учредитель: Комитет по языковой политике Министерства науки и высшего образования Республики Казахстан.</p><p>Периодичность: 4 выпуска в год.</p><p>Языки публикации: казахский, русский, английский.</p><h3>Тематические направления</h3><ul><li>Лингвистика и искусственный интеллект</li><li>Терминология</li><li>Методика преподавания языков</li></ul>'),
  (1, 'en', 'about', '<h3>About the Journal</h3><p>TIL ZHANE KOGAM is an international scientific electronic journal.</p><p>Founder: Committee on Language Policy of the Ministry of Science and Higher Education of the Republic of Kazakhstan.</p><p>Publication frequency: 4 issues per year.</p><p>Languages: Kazakh, Russian, English.</p><h3>Scope</h3><ul><li>Linguistics and Artificial Intelligence</li><li>Terminology</li><li>Language Teaching Methodology</li></ul>'),

  (1, 'kk', 'openAccessPolicy', 'Журнал ашық қолжетімділік саясатын ұстанады. Барлық материалдар Creative Commons Attribution 4.0 (CC BY 4.0) лицензиясы негізінде жарияланады.'),
  (1, 'ru', 'openAccessPolicy', 'Журнал придерживается политики открытого доступа. Все материалы публикуются на условиях лицензии Creative Commons Attribution 4.0 (CC BY 4.0).'),
  (1, 'en', 'openAccessPolicy', 'The journal follows an open access policy. All materials are published under the Creative Commons Attribution 4.0 (CC BY 4.0) license.'),

  (1, 'kk', 'privacyStatement', '<p>Сайтта көрсетілген аты-жөндер мен электрондық пошта мекенжайлары тек журналдың редакциялық мақсаттары үшін пайдаланылады және үшінші тараптарға берілмейді.</p>'),
  (1, 'ru', 'privacyStatement', '<p>Имена и адреса электронной почты, указанные на сайте журнала, используются исключительно для редакционных целей журнала и не передаются третьим лицам.</p>'),
  (1, 'en', 'privacyStatement', '<p>Names and email addresses entered in this journal site are used exclusively for editorial purposes of this journal and will not be shared with third parties.</p>'),

  (1, 'kk', 'authorGuidelines', '<h3>Авторларға нұсқаулық</h3><p>Журнал келесі материал түрлерін қабылдайды: түпнұсқа зерттеу мақалалары, шолу мақалалары, қысқа хабарламалар.</p><ul><li>Мақала тілдері: қазақ, орыс, ағылшын</li><li>Міндетті элементтер: тақырып, аңдатпа, түйін сөздер, әдебиеттер тізімі</li><li>Барлық авторлар үшін аффилиация және ORCID (бар болса) көрсетіледі</li><li>Рецензиялау моделі: double-blind</li></ul>'),
  (1, 'ru', 'authorGuidelines', '<h3>Руководство для авторов</h3><p>Журнал принимает: оригинальные исследовательские статьи, обзорные статьи, краткие сообщения.</p><ul><li>Языки публикации: казахский, русский, английский</li><li>Обязательные элементы: заголовок, аннотация, ключевые слова, список литературы</li><li>Для всех авторов указываются аффилиация и ORCID (при наличии)</li><li>Модель рецензирования: double-blind</li></ul>'),
  (1, 'en', 'authorGuidelines', '<h3>Author Guidelines</h3><p>The journal accepts original research articles, review articles, and short communications.</p><ul><li>Publication languages: Kazakh, Russian, English</li><li>Required elements: title, abstract, keywords, references</li><li>All authors must include affiliation and ORCID (if available)</li><li>Peer review model: double-blind</li></ul>'),

  (1, 'kk', 'editorialTeam', '<h3>Редакциялық алқа</h3><h4>Бас редактор</h4><p>Ә. ҚАБА</p><h4>Жауапты редактор</h4><p>Г. ТУСУПОВА</p><h4>Отандық ғалымдар</h4><ul><li>Ербол Тілешов</li><li>Шерубай Құрманбайұлы</li><li>Шалабай Бердібай</li><li>Балқия Қасым</li><li>Бекжан Әбдуәлиұлы</li><li>Бағдан Момынова</li><li>Алмагүл Әділова</li><li>Раушан Авакова</li><li>Гүлнар Мұратова</li><li>Зейнеп Базарбаева</li><li>Гүлнат Абикенова</li><li>Бекен Сағындықұлы</li><li>Орынай Жұбаева</li><li>Жанна Оспанова</li><li>Болат Хасенов</li><li>Әсел Орманова</li></ul><h4>Шетелдік ғалымдар</h4><ul><li>Валентина Маслова (Беларусь)</li><li>Рустам Шадиев (ҚХР)</li><li>Марина Пименова (Ресей)</li><li>Алима Перниязова (Өзбекстан)</li><li>Аян Экрем (Түркия)</li></ul>'),
  (1, 'ru', 'editorialTeam', '<h3>Редакционная коллегия</h3><h4>Главный редактор</h4><p>Ә. ҚАБА</p><h4>Ответственный редактор</h4><p>Г. ТУСУПОВА</p><h4>Отечественные ученые</h4><ul><li>Ербол Тілешов</li><li>Шерубай Құрманбайұлы</li><li>Шалабай Бердібай</li><li>Балқия Қасым</li><li>Бекжан Әбдуәлиұлы</li><li>Бағдан Момынова</li><li>Алмагүл Әділова</li><li>Раушан Авакова</li><li>Гүлнар Мұратова</li><li>Зейнеп Базарбаева</li><li>Гүлнат Абикенова</li><li>Бекен Сағындықұлы</li><li>Орынай Жұбаева</li><li>Жанна Оспанова</li><li>Болат Хасенов</li><li>Әсел Орманова</li></ul><h4>Зарубежные ученые</h4><ul><li>Валентина Маслова (Беларусь)</li><li>Рустам Шадиев (КНР)</li><li>Марина Пименова (Россия)</li><li>Алима Перниязова (Узбекистан)</li><li>Аян Экрем (Турция)</li></ul>'),
  (1, 'en', 'editorialTeam', '<h3>Editorial Board</h3><h4>Editor-in-Chief</h4><p>Ә. ҚАБА</p><h4>Managing Editor</h4><p>Г. ТУСУПОВА</p><h4>Domestic scholars</h4><ul><li>Erbol Tileshov</li><li>Sherubai Kurmanbaiuly</li><li>Shalabai Berdibai</li><li>Balkiya Kassym</li><li>Bekzhan Abdualiuly</li><li>Bagdan Momynova</li><li>Almagul Adilova</li><li>Raushan Avakova</li><li>Gulnar Muratova</li><li>Zeynep Bazarbayeva</li><li>Gulnat Abikenova</li><li>Beken Sagyndykuly</li><li>Orynai Zhubayeva</li><li>Zhanna Ospanova</li><li>Bolat Khasenov</li><li>Asel Ormanova</li></ul><h4>International scholars</h4><ul><li>Valentina Maslova (Belarus)</li><li>Rustam Shadiev (China)</li><li>Marina Pimenova (Russia)</li><li>Alima Perniyazova (Uzbekistan)</li><li>Ayan Ekrem (Turkey)</li></ul>')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value)
VALUES
  (1, '', 'primaryLocale', 'kk'),
  (1, '', 'supportedLocales', '["kk","ru","en"]'),
  (1, '', 'supportedFormLocales', '["kk","ru","en"]'),
  (1, '', 'supportedSubmissionLocales', '["kk","ru","en"]'),
  (1, '', 'contactName', 'Редакция журнала «ТІЛ ЖӘНЕ ҚОҒАМ»'),
  (1, '', 'supportName', 'Managing Editor'),
  (1, '', 'contactEmail', 'til.qogam@tilqazyna.kz'),
  (1, '', 'supportEmail', 'til.qogam@tilqazyna.kz'),
  (1, '', 'mailingAddress', '010000, Kazakhstan, Astana, Sauran street 7A'),
  (1, '', 'publisherInstitution', 'Committee on Language Policy, Ministry of Science and Higher Education, Republic of Kazakhstan'),
  (1, '', 'searchDescription', 'TIL ZHANE KOGAM international scientific electronic journal'),
  (1, '', 'defaultReviewMode', '2'),
  (1, '', 'numWeeksPerResponse', '2'),
  (1, '', 'numWeeksPerReview', '4'),
  (1, '', 'enableDois', '0'),
  (1, '', 'licenseUrl', 'https://creativecommons.org/licenses/by/4.0'),
  (1, '', 'copyrightHolderType', 'author'),
  (1, '', 'membershipFee', '0'),
  (1, '', 'publicationFee', '0'),
  (1, '', 'purchaseArticleFee', '0'),
  (1, '', 'paymentPluginName', ''),
  (1, '', 'themePluginPath', 'pragma')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

-- Keep styleSheet only if present in public files
INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value)
VALUES
  (1, '', 'styleSheet', '{"name":"custom.css","uploadName":"custom.css","dateUploaded":"2026-02-11 12:00:00"}')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

-- -----------------------------
-- Homepage blocks
-- -----------------------------
INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value)
VALUES
  (1, 'kk', 'pageFooter', '<div class="custom-footer"><div class="footer-grid"><div class="footer-col"><h4>ТІЛ ЖӘНЕ ҚОҒАМ</h4><p>Халықаралық ғылыми электрондық журнал</p><p class="footer-issn">Шығу жиілігі: жылына 4 рет</p></div><div class="footer-col"><h4>Навигация</h4><ul><li><a href="/journal">Басты бет</a></li><li><a href="/journal/issue/current">Ағымдағы шығарылым</a></li><li><a href="/journal/issue/archive">Архив</a></li><li><a href="/journal/about/submissions">Мақала жіберу</a></li></ul></div><div class="footer-col"><h4>Ақпарат</h4><ul><li><a href="/journal/about">Журнал туралы</a></li><li><a href="/journal/about/editorialTeam">Редакциялық алқа</a></li><li><a href="/journal/about/privacy">Құпиялылық саясаты</a></li><li><a href="/journal/about/contact">Байланыс</a></li></ul></div><div class="footer-col"><h4>Байланыс</h4><p>Астана, Сауран 7A</p><p><a href="mailto:til.qogam@tilqazyna.kz">til.qogam@tilqazyna.kz</a></p></div></div><div class="footer-bottom"><p>&copy; 2026 ТІЛ ЖӘНЕ ҚОҒАМ. Барлық құқықтар қорғалған.</p><p><a href="https://pkp.sfu.ca/software/ojs/" target="_blank" rel="noopener">Open Journal Systems</a> платформасында жарияланған</p></div></div>'),
  (1, 'ru', 'pageFooter', '<div class="custom-footer"><div class="footer-grid"><div class="footer-col"><h4>ТІЛ ЖӘНЕ ҚОҒАМ</h4><p>Международный научный электронный журнал</p><p class="footer-issn">Периодичность: 4 выпуска в год</p></div><div class="footer-col"><h4>Навигация</h4><ul><li><a href="/journal">Главная</a></li><li><a href="/journal/issue/current">Текущий выпуск</a></li><li><a href="/journal/issue/archive">Архив</a></li><li><a href="/journal/about/submissions">Подать статью</a></li></ul></div><div class="footer-col"><h4>Информация</h4><ul><li><a href="/journal/about">О журнале</a></li><li><a href="/journal/about/editorialTeam">Редколлегия</a></li><li><a href="/journal/about/privacy">Политика конфиденциальности</a></li><li><a href="/journal/about/contact">Контакты</a></li></ul></div><div class="footer-col"><h4>Контакты</h4><p>Астана, ул. Сауран 7A</p><p><a href="mailto:til.qogam@tilqazyna.kz">til.qogam@tilqazyna.kz</a></p></div></div><div class="footer-bottom"><p>&copy; 2026 ТІЛ ЖӘНЕ ҚОҒАМ. Все права защищены.</p><p>Опубликовано на платформе <a href="https://pkp.sfu.ca/software/ojs/" target="_blank" rel="noopener">Open Journal Systems</a></p></div></div>'),
  (1, 'en', 'pageFooter', '<div class="custom-footer"><div class="footer-grid"><div class="footer-col"><h4>TIL ZHANE KOGAM</h4><p>International scientific electronic journal</p><p class="footer-issn">Publication frequency: 4 issues per year</p></div><div class="footer-col"><h4>Navigation</h4><ul><li><a href="/journal">Home</a></li><li><a href="/journal/issue/current">Current Issue</a></li><li><a href="/journal/issue/archive">Archives</a></li><li><a href="/journal/about/submissions">Submit Article</a></li></ul></div><div class="footer-col"><h4>Information</h4><ul><li><a href="/journal/about">About the Journal</a></li><li><a href="/journal/about/editorialTeam">Editorial Board</a></li><li><a href="/journal/about/privacy">Privacy Policy</a></li><li><a href="/journal/about/contact">Contact</a></li></ul></div><div class="footer-col"><h4>Contact</h4><p>Astana, Sauran 7A</p><p><a href="mailto:til.qogam@tilqazyna.kz">til.qogam@tilqazyna.kz</a></p></div></div><div class="footer-bottom"><p>&copy; 2026 TIL ZHANE KOGAM. All rights reserved.</p><p>Published on <a href="https://pkp.sfu.ca/software/ojs/" target="_blank" rel="noopener">Open Journal Systems</a></p></div></div>')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value)
VALUES
  (1, 'kk', 'additionalHomeContent', '<div class="home-features"><div class="features-grid"><div class="feature-card"><div class="feature-icon">&#128270;</div><h4>Қатаң рецензиялау</h4><p>Барлық материалдар double-blind рецензиялау арқылы бағаланады.</p></div><div class="feature-card"><div class="feature-icon">&#127760;</div><h4>Үш тілде жариялау</h4><p>Журнал қазақ, орыс және ағылшын тілдерінде мақалалар қабылдайды.</p></div><div class="feature-card"><div class="feature-icon">&#128218;</div><h4>Ғылыми бағыт</h4><p>Лингвистика және ЖИ, терминология, тіл оқыту әдістемесі.</p></div></div></div><div class="home-cta"><h3>Мақала жіберу</h3><p>Түпнұсқа зерттеу, шолу мақаласы және қысқа хабарлама түрлері қабылданады.</p><a href="/journal/about/submissions" class="btn btn-primary">Авторларға нұсқаулық</a><a href="/journal/user/register" class="btn btn-secondary">Тіркелу</a></div>'),
  (1, 'ru', 'additionalHomeContent', '<div class="home-features"><div class="features-grid"><div class="feature-card"><div class="feature-icon">&#128270;</div><h4>Строгое рецензирование</h4><p>Все материалы проходят double-blind рецензирование.</p></div><div class="feature-card"><div class="feature-icon">&#127760;</div><h4>Публикация на 3 языках</h4><p>Журнал принимает статьи на казахском, русском и английском языках.</p></div><div class="feature-card"><div class="feature-icon">&#128218;</div><h4>Научный фокус</h4><p>Лингвистика и ИИ, терминология, методика преподавания языков.</p></div></div></div><div class="home-cta"><h3>Подать статью</h3><p>Принимаются оригинальные исследования, обзорные статьи и краткие сообщения.</p><a href="/journal/about/submissions" class="btn btn-primary">Руководство для авторов</a><a href="/journal/user/register" class="btn btn-secondary">Регистрация</a></div>'),
  (1, 'en', 'additionalHomeContent', '<div class="home-features"><div class="features-grid"><div class="feature-card"><div class="feature-icon">&#128270;</div><h4>Rigorous Peer Review</h4><p>All submissions are evaluated through double-blind peer review.</p></div><div class="feature-card"><div class="feature-icon">&#127760;</div><h4>Trilingual Publishing</h4><p>The journal accepts papers in Kazakh, Russian, and English.</p></div><div class="feature-card"><div class="feature-icon">&#128218;</div><h4>Scope</h4><p>Linguistics and AI, terminology, and language teaching methodology.</p></div></div></div><div class="home-cta"><h3>Submit Your Paper</h3><p>We accept original research articles, review articles, and short communications.</p><a href="/journal/about/submissions" class="btn btn-primary">Author Guidelines</a><a href="/journal/user/register" class="btn btn-secondary">Create Account</a></div>')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

-- -----------------------------
-- Sections (5)
-- -----------------------------
INSERT INTO section_settings (section_id, locale, setting_name, setting_value)
VALUES
  -- 1: Linguistics and AI
  (1, 'kk', 'title', 'Лингвистика және жасанды интеллект'),
  (1, 'kk', 'abbrev', 'ЛЖИ'),
  (1, 'kk', 'policy', 'Лингвистика және жасанды интеллект бағытындағы түпнұсқа ғылыми мақалалар.'),
  (1, 'ru', 'title', 'Лингвистика и искусственный интеллект'),
  (1, 'ru', 'abbrev', 'ЛИИ'),
  (1, 'ru', 'policy', 'Оригинальные научные статьи по лингвистике и искусственному интеллекту.'),
  (1, 'en', 'title', 'Linguistics and Artificial Intelligence'),
  (1, 'en', 'abbrev', 'LAI'),
  (1, 'en', 'policy', 'Original research papers in linguistics and artificial intelligence.'),

  -- 2: Language Teaching Methodology
  (2, 'kk', 'title', 'Тіл оқыту әдістемесі'),
  (2, 'kk', 'abbrev', 'ТОӘ'),
  (2, 'kk', 'policy', 'Тіл оқыту әдістемесіне арналған зерттеулер мен практикалық мақалалар.'),
  (2, 'ru', 'title', 'Методика преподавания языков'),
  (2, 'ru', 'abbrev', 'МПЯ'),
  (2, 'ru', 'policy', 'Исследования и практические статьи по методике преподавания языков.'),
  (2, 'en', 'title', 'Language Teaching Methodology'),
  (2, 'en', 'abbrev', 'LTM'),
  (2, 'en', 'policy', 'Research and practice papers on language teaching methodology.'),

  -- 3: Terminology
  (3, 'kk', 'title', 'Терминология'),
  (3, 'kk', 'abbrev', 'ТЕРМ'),
  (3, 'kk', 'policy', 'Терминтану, терминжасам және салалық терминология мәселелері бойынша мақалалар.'),
  (3, 'ru', 'title', 'Терминология'),
  (3, 'ru', 'abbrev', 'ТЕРМ'),
  (3, 'ru', 'policy', 'Статьи по терминоведению, терминотворчеству и отраслевой терминологии.'),
  (3, 'en', 'title', 'Terminology'),
  (3, 'en', 'abbrev', 'TERM'),
  (3, 'en', 'policy', 'Articles on terminology studies, term formation, and domain terminology.'),

  -- 4: Review articles
  (4, 'kk', 'title', 'Шолу мақалалары'),
  (4, 'kk', 'abbrev', 'ШМ'),
  (4, 'kk', 'policy', 'Ғылыми әдебиеттерге талдамалы шолу мақалалары.'),
  (4, 'ru', 'title', 'Обзорные статьи'),
  (4, 'ru', 'abbrev', 'ОС'),
  (4, 'ru', 'policy', 'Аналитические обзорные статьи по актуальным научным направлениям.'),
  (4, 'en', 'title', 'Review Articles'),
  (4, 'en', 'abbrev', 'REV'),
  (4, 'en', 'policy', 'Analytical review papers in relevant research areas.'),

  -- 5: Short communications
  (5, 'kk', 'title', 'Қысқа хабарламалар'),
  (5, 'kk', 'abbrev', 'ҚХ'),
  (5, 'kk', 'policy', 'Жедел жариялауға ұсынылатын қысқа ғылыми хабарламалар.'),
  (5, 'ru', 'title', 'Краткие сообщения'),
  (5, 'ru', 'abbrev', 'КС'),
  (5, 'ru', 'policy', 'Краткие научные сообщения для оперативной публикации.'),
  (5, 'en', 'title', 'Short Communications'),
  (5, 'en', 'abbrev', 'SC'),
  (5, 'en', 'policy', 'Short scientific communications suitable for rapid publication.')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

-- -----------------------------
-- Issue #1 metadata (placeholder)
-- -----------------------------
UPDATE issues
SET
  volume = 61,
  number = '1',
  year = 2025,
  published = 1,
  date_published = '2025-04-25 08:57:00',
  show_volume = 1,
  show_number = 1,
  show_year = 1,
  show_title = 1
WHERE issue_id = 1
  AND journal_id = 1;

INSERT INTO issue_settings (issue_id, locale, setting_name, setting_value)
VALUES
  (1, 'kk', 'title', '№1 (61), 2025'),
  (1, 'ru', 'title', '№1 (61), 2025'),
  (1, 'en', 'title', 'No. 1 (61), 2025'),
  (1, 'kk', 'description', '<p>«ТІЛ ЖӘНЕ ҚОҒАМ» халықаралық ғылыми электрондық журналының ағымдағы шығарылымы.</p>'),
  (1, 'ru', 'description', '<p>Текущий выпуск международного научного электронного журнала «ТІЛ ЖӘНЕ ҚОҒАМ».</p>'),
  (1, 'en', 'description', '<p>Current issue of the international scientific electronic journal TIL ZHANE KOGAM.</p>')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

-- -----------------------------
-- Announcement
-- -----------------------------
UPDATE announcements
SET date_posted = '2025-04-25 09:00:00'
WHERE announcement_id = 1
  AND assoc_id = 1;

INSERT INTO announcement_settings (announcement_id, locale, setting_name, setting_value)
VALUES
  (1, 'kk', 'title', 'Журнал OJS платформасында іске қосылды'),
  (1, 'kk', 'descriptionShort', '«ТІЛ ЖӘНЕ ҚОҒАМ» журналының жаңартылған сайты іске қосылды.'),
  (1, 'kk', 'description', '<p>Құрметті авторлар мен оқырмандар!</p><p>«ТІЛ ЖӘНЕ ҚОҒАМ» журналының OJS платформасындағы жаңартылған сайты іске қосылды.</p><p>Журналға мақала жіберу үшін сайтта тіркеліп, жеке кабинет арқылы материал жүктей аласыз.</p>'),
  (1, 'ru', 'title', 'Журнал запущен на платформе OJS'),
  (1, 'ru', 'descriptionShort', 'Обновленный сайт журнала «ТІЛ ЖӘНЕ ҚОҒАМ» запущен.'),
  (1, 'ru', 'description', '<p>Уважаемые авторы и читатели!</p><p>Обновленный сайт журнала «ТІЛ ЖӘНЕ ҚОҒАМ» запущен на платформе OJS.</p><p>Для подачи статьи зарегистрируйтесь на сайте и загрузите материал через личный кабинет автора.</p>'),
  (1, 'en', 'title', 'Journal launched on OJS platform'),
  (1, 'en', 'descriptionShort', 'The updated website of TIL ZHANE KOGAM has been launched.'),
  (1, 'en', 'description', '<p>Dear authors and readers,</p><p>The updated TIL ZHANE KOGAM website is now live on the OJS platform.</p><p>To submit a paper, please register and upload your manuscript through the author dashboard.</p>')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

-- -----------------------------
-- Assign admin user to all core journal roles for local MVP
-- -----------------------------
INSERT INTO user_user_groups (user_group_id, user_id)
SELECT ug.user_group_id, 1
FROM user_groups ug
WHERE ug.context_id = 1
  AND ug.user_group_id IN (3,4,5,6,7)
  AND NOT EXISTS (
    SELECT 1
    FROM user_user_groups uug
    WHERE uug.user_group_id = ug.user_group_id
      AND uug.user_id = 1
  );

-- -----------------------------
-- User display name for admin (local MVP)
-- -----------------------------
INSERT INTO user_settings (user_id, locale, setting_name, setting_value)
VALUES
  (1, 'kk', 'givenName', 'Редакция'),
  (1, 'kk', 'familyName', 'ТІЛ ЖӘНЕ ҚОҒАМ'),
  (1, 'ru', 'givenName', 'Редакция'),
  (1, 'ru', 'familyName', 'ТІЛ ЖӘНЕ ҚОҒАМ'),
  (1, 'en', 'givenName', 'Editorial'),
  (1, 'en', 'familyName', 'TIL ZHANE KOGAM')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);
