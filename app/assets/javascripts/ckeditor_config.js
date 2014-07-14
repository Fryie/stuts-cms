CKEDITOR.config.toolbar_CMS = [
  ['Cut','Copy','Paste','PasteText','-','SpellChecker','Scayt','-','Undo','Redo','Find','Replace','RemoveFormat','-','NumberedList','BulletedList'],
  '/',
  ['Link','Unlink','Anchor','Image','Table','SpecialChar','-','Bold','Italic','-','Styles']
];

CKEDITOR.config.width = 598;
CKEDITOR.config.height = 400;
CKEDITOR.config.toolbar = 'CMS';

CKEDITOR.stylesSet.add('stuts_cms_styles', [
    { name : 'Paragraph', element: 'p' },
    { name : 'Heading 1', element: 'h1' },
    { name : 'Heading 2', element: 'h2' },
    { name : 'Heading 3', element: 'h3' }
]);

CKEDITOR.config.stylesSet = 'stuts_cms_styles';
