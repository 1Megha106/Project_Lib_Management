document.getElementById('login-form').addEventListener('submit', function(event) {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    if (username === '' || password === '') {
        alert('Both username and password are required.');
        event.preventDefault(); 
    }
});

function updateBookAvailability(bookId, isAvailable) {
    const statusElement = document.getElementById('book-${bookId}-status');
    statusElement.textContent = isAvailable ? 'Available' : 'Not Available';
}

document.querySelectorAll('.book-title').forEach(title => {
    title.addEventListener('click', function() {
        const bookId = this.dataset.bookId;
        const details = document.getElementById('book-${bookId}-details');
        details.classList.toggle('hidden');
    });
});

async function fetchBookDetails(bookId) {
    try {
        const response = await fetch('/api/books/${bookId}');
        const book = await response.json();
        displayBookDetails(book);
    } catch (error) {
        console.error('Error fetching book details:', error);
    }
}

function displayBookDetails(book) {
    const detailsElement = document.getElementById('book-details');
    detailsElement.innerHTML = `
        <h3>${book.title}</h3>
        <p>Author: ${book.author}</p>
        <p>Edition: ${book.edition}</p>
        <p>Publication Year: ${book.publication_year}</p>
    `;
}

document.getElementById('login-form').addEventListener('submit', function(event) {
    window.location.href = 'admin_home.html';
});

setInterval(async function() {
    try {
        const response = await fetch('/api/issues/active');
        const issues = await response.json();
        updateIssueList(issues);
    } catch (error) {
        console.error('Error fetching issues:', error);
    }
}, 30000);

function updateIssueList(issues) {
    const issueList = document.getElementById('issue-list');
    issueList.innerHTML = issues.map(issue => <li>${issue.title}</li>).join('');
}

document.getElementById('open-modal').addEventListener('click', function() {
    document.getElementById('modal').style.display = 'block';
});

document.getElementById('close-modal').addEventListener('click', function() {
    document.getElementById('modal').style.display = 'none';
});
