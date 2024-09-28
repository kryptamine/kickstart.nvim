return {
  {
    'chrisgrieser/nvim-recorder',
    dependencies = 'rcarriga/nvim-notify',
    config = function()
      require('recorder').setup {
        mapping = {
          startStopRecording = 'q',
          playMacro = 'Q',
        },
      }
    end,
  },
}
