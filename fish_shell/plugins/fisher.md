# Fisher — Менеджер плагинов для Fish

Fisher — это менеджер плагинов для интерактивной оболочки **Fish**. Устанавливайте, обновляйте и удаляйте плагины прямо из командной строки, чтобы раскрыть весь потенциал вашего окружения!

---

## **Почему стоит выбрать Fisher?**

- **Полностью на Fish:** Легко дорабатывать и модифицировать под ваши нужды.
- **Молниеносная установка плагинов:** Fisher загружает плагины параллельно, что значительно ускоряет процесс.
- **Минимум конфигурации:** Работает сразу после установки.
- **Поддержка Oh My Fish! плагинов:** Устанавливайте плагины, разработанные для других менеджеров.

---

## **Установка**

Установить Fisher можно одной командой:
```bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

---

## **Быстрый старт**

### **Установка плагинов**
Чтобы установить плагин, используйте команду `install` и укажите путь к репозиторию:
```bash
fisher install jorgebucaran/nvm.fish
```

Хотите установить плагин с GitLab? Просто добавьте `gitlab.com/` перед именем плагина:
```bash
fisher install gitlab.com/user/repo
```

Можно установить определённую версию плагина с помощью символа `@` и указания тега, ветки или коммита:
```bash
fisher install IlanCosman/tide@v5
```

И даже установить плагины из локальной директории:
```bash
fisher install ~/path/to/plugin
```

> **Примечание:** По умолчанию Fisher разворачивает плагины в конфигурационную директорию Fish, перезаписывая существующие файлы. Чтобы изменить это поведение, настройте переменную `$fisher_path`.

---

### **Список установленных плагинов**
Чтобы увидеть список установленных плагинов, выполните:
```bash
fisher list
```
Пример вывода:
```bash
jorgebucaran/fisher
ilancosman/tide@v5
jorgebucaran/nvm.fish
/home/user/custom-plugin
```

Вы можете фильтровать вывод с помощью регулярных выражений:
```bash
fisher list \^/
```

---

### **Обновление плагинов**
Команда `update` обновляет плагины до последней версии:
```bash
fisher update jorgebucaran/fisher
```
Чтобы обновить все плагины сразу:
```bash
fisher update
```

---

### **Удаление плагинов**
Удалите ненужный плагин с помощью команды `remove`:
```bash
fisher remove jorgebucaran/nvm.fish
```
Для удаления всех плагинов, включая сам Fisher:
```bash
fisher list | fisher remove
```

---

## **Популярные промпты**

- [**Tide**](https://github.com/IlanCosman/tide) — Современный менеджер промптов для Fish.
- [**Pure**](https://github.com/pure-fish/pure/) — Популярный ZSH-промпт, адаптированный для Fish.
- [**Hydro**](https://github.com/jorgebucaran/hydro) — Быстрый промпт с асинхронным статусом Git.

---

## **Популярные плагины**

| **Плагин** | **Описание** |
|------------|--------------|
| [z](https://github.com/jethrokuan/z) | Быстрое перемещение по директориям. |
| [fzf](https://github.com/PatrickF1/fzf.fish) | Быстрая фильтрация с поддержкой `fzf`. |
| [nvm](https://github.com/jorgebucaran/nvm.fish) | Менеджер версий Node.js для Fish. |
| [Done](https://github.com/franciscolourenco/done) | Уведомления о завершении долгих процессов. |
| [Replay](https://github.com/jorgebucaran/replay.fish) | Повторный запуск Bash-команд в Fish. |
| [Spark](https://github.com/jorgebucaran/spark.fish) | Создание мини-графиков прямо в терминале. |
| [Fisher](https://github.com/jorgebucaran/fisher) | Сам Fisher — для управления плагинами. |
| [GitNow](https://github.com/joseluisq/gitnow) | Ускорение работы с Git с помощью удобных функций. |
| [Autopair](https://github.com/jorgebucaran/autopair.fish) | Автозакрытие скобок и кавычек. |
| [Getopts](https://github.com/jorgebucaran/getopts.fish) | Парсер опций командной строки. |
| [Fishtape](https://github.com/jorgebucaran/fishtape) | TAP-тестирование для Fish. |
| [Sponge](https://github.com/meaningful-ooo/sponge) | Автоматическое исправление истории команд. |
| [Virtualfish](https://github.com/adambrenecki/virtualfish) | Оболочка для виртуальных окружений Python. |

