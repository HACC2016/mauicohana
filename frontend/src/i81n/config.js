/**
 * Import localization file with translations
 */
import translations from './translations'

export default {
  /**
   * The list of application languages
   */
  languages: {
    en: {
      key: 'eng', // phrase key in the translation file for translating language name into different languages
      enabled: true // Set to false if need to disable language
    },
    jp: {
      key: 'rus',
      enabled: true
    },
    sp: {
      key: 'sp',
      enabled: false
    }
  },

  /**
   * Default language will be used if the language is not defined
   */
  defaultLanguage: 'en',

  /**
   * The object with translations of application phrases
   */
  translations: translations,
  defaultLanguageRoute: false,
  resaveOnLocalizedRoutes: false,
  defaultContextName: 'global',
  fallbackOnNoTranslation: true,
  fallbackLanguage: 'en',

  /**
   * Helps during translation development!
   */
  supressWarnings: false
}
