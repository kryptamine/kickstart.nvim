return {
  {
    'chrisgrieser/nvim-early-retirement',
    config = true,
    event = 'VeryLazy',
    opts = {
      retirementAgeMins = 20,
      deleteBufferWhenFileDeleted = true,
    },
  },
}
