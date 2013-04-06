" Maintainer: Wataru KASAHARA <Wataru.Kasahara@gmail.com>
" Last Change: 2013 Apr 06

"----------------------------------------------------
" Visual
"----------------------------------------------------
" �J���[�ݒ�:
colorscheme darkblue
" �����x�ݒ�
gui
set transparency=210
" �c��  �f�t�H���g��24
set lines=100
" ����  �f�t�H���g��80
set columns=220

"----------------------------------------------------
" �\���֌W
"----------------------------------------------------
" �^�C�g�����E�C���h�E�g�ɕ\������
set title
" �s�ԍ���\������
set number
" �^�u�ƍs����\������
set list
" ���[���[��\��
set ruler
" ���͒��̃R�}���h���X�e�[�^�X�ɕ\������
set showcmd
" �X�e�[�^�X���C������ɕ\��
set laststatus=2
" ���ʓ��͎��̑Ή����銇�ʂ�\��
"�����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�\������
set showmatch
" �V���^�b�N�X�n�C���C�g��L���ɂ���
syntax on
" �������ʕ�����̃n�C���C�g��L���ɂ���
set hlsearch
" �R�����g���̐F��ύX
highlight Comment ctermfg=DarkCyan
"�V�����s�̃C���f���g�����ݍs�Ɠ����ɂ���
set autoindent
"�^�u�̑���ɋ󔒕�����}������
set expandtab
"�C���N�������^���T�[�`���s��
set incsearch
" �����̎��ɑ啶������������ʂ��Ȃ�
set ignorecase
"�������ɑ啶�����܂�ł������/�������
set smartcase
"�V�����s��������Ƃ��ɍ��x�Ȏ����C���f���g���s��
set smartindent
" �J�[�\���s�ɉ���
set cursorline


" --- --- --- --- ---
" �V�t�g�ړ���
"set shiftwidth=2
" �s���̗]������ Tab ��ł����ނƁA'shiftwidth' �̐������C���f���g����B
"set smarttab
" �t�@�C������ <Tab> ���Ή�����󔒂̐�
"set tabstop=2
set expandtab
" list�ŕ\������镶���̃t�H�[�}�b�g���w�肷��
" --> tab:�^�u, trail:�s���ɑ����X�y�[�X, 
set listchars=tab:>.,trail:_,extends:\,eol:$
" set listchars �Ŏw�肵���u������������
set list
" �S�p�X�y�[�X�̎��o��
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /�@/
" �^�u��
set softtabstop=2
"�^�u�̑���ɋ󔒕�����}������
set expandtab
" �^�u��\������Ƃ��̕�
set tabstop=2
" �^�u��}������Ƃ��̕�
set shiftwidth=2


" ------------------------------------------
" GNU Global�̐ݒ�
"Ctrl+t :Gtags �Ɠ��͂���
"Ctrl+h :�J�[�\�����������current�̃\�[�X�R�[�h�� grep
"Ctrl+i �J���Ă���t�@�C���ɒ�`����Ă���֐��̈ꗗ��\��
"Ctrl+j �J�[�\���ʒu�̊֐��փW�����v
"Ctrl+n ���̌������ʂփW�����v����
"Ctrl+p �O�̌������ʂփW�����v����
noremap <C-t> :Gtags
noremap <C-r> :Gtags -r
noremap <C-h> :Gtags -gl<CR>
noremap <C-i> :Gtags -f %<CR>
noremap <C-j> :GtagsCursor<CR>
noremap <C-n> :cn<CR>
noremap <C-p> :cp<CR>
":Gtags �֐���        | �֐��� �� �\�[�X�R�[�h�i��`�j
":Gtags -r �֐���         | �֐��� �� �\�[�X�R�[�h�i�Q�Ɓj
":Gtags -f �t�@�C���� | �\�[�X�R�[�h �� �֐��ꗗ
"global -c �֐����ꕔ | �֐����̈ꕔ �� �֐��ꗗ
":Gtags -g ���������� | �\�[�X�R�[�h�� grep
