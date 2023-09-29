# 🚀 **О проекте**:  

Данное приложение создано в рамках тестового задания для стажёра iOS в Avito и служит для демонстрации навыков разработки и взаимодействия с удаленными данными. Приложение предоставляет возможность просмотра списка товаров и детальной информации по каждому товару.

# 🖼️ **Скриншоты**:

<p float="left">
  <img src="https://github.com/MickeyRU/Avito_TestTask/assets/91372236/06a7c678-195e-4530-91eb-8117c244dab8" width="23%" />
  <img src="https://github.com/MickeyRU/Avito_TestTask/assets/91372236/fca4a5bc-113e-41c0-940a-d97447adbd0f" width="23%" /> 
  <img src="https://github.com/MickeyRU/Avito_TestTask/assets/91372236/6bf53f37-9602-443c-98f1-6f666b5363f0" width="23%" />
  <img src="https://github.com/MickeyRU/Avito_TestTask/assets/91372236/dc5febd7-74d8-471a-98c5-287dd90a4427" width="23%" />
</p>

# 🔍 **Основные Функции**:

1. **Список товаров**:   
   - Стартовый экран приложения.
   - Отображает товары в виде списка - используется UICollectionView с отображением в 2 столбца.
   - Переход к детальной информации о товаре при нажатии на элемент списка.

2. **Детальное описание товара**:   
   - Предоставление полной информации о выбранном товаре.

# 🌟 **Особенности**:

- **Три Состояния Экрана**:   
   - Загрузка: Использование `ProgressHUD` для отображения процесса загрузки.
   - Контент: Отображение данных, загруженных из сети, с использованием `Kingfisher` для изображений.
   - Ошибка: Визуализация ошибок через `UIAlertController`.

- **Дизайн**:   
   - Интерфейс, вдохновлённый приложением Avito.

# 🛠 **Технологии**:

- UIKit
- Kingfisher
- ProgressHUD
- GIT
- MVVM (binding с использованием property wrapper)
- Верстка Кодом
- Темная тема

# 🚀 **Запуск**:

1. Клонировать репозиторий
```
git clone https://github.com/MickeyRU/Avito_TestTask/

```

2. Перейти в директорию проекта
```
cd Avito_TestTask

```

3. Открыть проект в Xcode
Откройте файл с расширением `.xcodeproj`.

4. Запустить проект
Запустите приложение, нажав на 'Run', или используя комбинацию клавиш `Cmd + R`. Зависимости проекта управляются с использованием Swift Package Manager и будут автоматически установлены при первом запуске.
