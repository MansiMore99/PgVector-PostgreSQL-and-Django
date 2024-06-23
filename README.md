# pgvector 🚀

**pgvector** is a PostgreSQL extension that allows you to store, query, and index vectors.

## What is a Vector? 🤔

In short, vectors are just lists of numbers. If you ever took a linear algebra course, this is the time to reap the benefits as similarity search is doing a bunch of vector operations after all!

## Who Needs Vector Similarity Search? 🧐

When working with high-dimensional data, especially in applications like recommendation engines, image search, and natural language processing, vector similarity search is critical. Many AI applications involve finding similar items or recommendations based on user behavior or content similarity. **pgvector** can perform vector similarity searches efficiently, making it suitable for recommendation systems, content-based filtering, and similarity-based AI tasks.

## Storage Limits 📦

A non-partitioned table has a limit of 32 TB by default in Postgres. A partitioned table can have thousands of partitions of that size.

## Vector Type 🧮

Each vector takes `4 * dimensions + 8` bytes of storage. Each element is a single-precision floating-point number (like the `real` type in Postgres), and all elements must be finite (no `NaN`, `Infinity`, or `-Infinity`). Vectors can have up to 16,000 dimensions.

## Vector Operations 🔧

This table provides a list of operators, their descriptions, and the versions they were added in:

<table>
  <thead>
    <tr>
      <th>Operator</th>
      <th>Description</th>
      <th>Added</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>+</td>
      <td>element-wise addition</td>
      <td></td>
    </tr>
    <tr>
      <td>-</td>
      <td>element-wise subtraction</td>
      <td></td>
    </tr>
    <tr>
      <td>*</td>
      <td>element-wise multiplication</td>
      <td>0.5.0</td>
    </tr>
    <tr>
      <td>||</td>
      <td>concatenate</td>
      <td>0.7.0</td>
    </tr>
    <tr>
      <td>&lt;-&gt;</td>
      <td>Euclidean distance</td>
      <td></td>
    </tr>
    <tr>
      <td>&lt;#&gt;</td>
      <td>negative inner product</td>
      <td></td>
    </tr>
    <tr>
      <td>&lt;=&gt;</td>
      <td>cosine distance</td>
      <td></td>
    </tr>
    <tr>
      <td>&lt;+&gt;</td>
      <td>taxicab distance</td>
      <td>0.7.0</td>
    </tr>
  </tbody>
</table>


## Python Support 🐍

**pgvector** support for Python includes integration with popular frameworks and libraries:
- Django
- SQLModel
- Psycopg 3
- Psycopg 2
- asyncpg
- Peewee

## Installation 📥

To install **pgvector**, run the following command:

```
pip install pgvector
```

### Getting Started 🚀

1. **Enable pgvector Extension** 📦

Once pgvector is installed, you can enable it in your Postgres database by creating the extension:

   ```
   CREATE EXTENSION vector;
   ```

2. **Create a Table** 🗄️

Create a table to store your vectors:

```
CREATE TABLE items (
  id bigserial PRIMARY KEY,
  embedding vector(3));
```


3. **Generate and Store Embeddings** 🧬

An embedding is a vector (list) of floating-point numbers. The distance between two vectors measures their relatedness. Small distances suggest high relatedness, and large distances suggest low relatedness.

To insert embeddings into your table, use:
```
INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');
```

4. **Querying Embeddings** 🔍

Query to find the top 5 items most similar to a given vector:

```
SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;
```







<a href="https://www.linkedin.com/in/mansi-more-0943/"> ![LinkedIn Profile](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) </a>








