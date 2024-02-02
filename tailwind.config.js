module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/assets/**/*.svg',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,css,rb}'
  ],
  theme: {
    extend: {
      animation: {
        'spin-fast': 'spin 0.7s linear infinite',
        'fade-in-up': 'fade-in-up 0.3s ease-in-out'
      },
      colors: {
        "vivid-sky-blue": "#1CCEED",
        "citrine": "#EDD71C",
        "cerise-pink": "#ED1C7A",
        "twilight-lavender": "#98456A",
        "cadet": {
          800: "#3F6066",
          900: "#44676E",
        },
        dim: {
          50: "#5F99F7",
          100: "#5F99F7",
          200: "#38444d",
          300: "#202e3a",
          400: "#253341",
          500: "#5F99F7",
          600: "#5F99F7",
          700: "#192734",
          800: "#162d40",
          900: "#15202b",
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ]
}