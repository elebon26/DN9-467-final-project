 MGMT 467 – AI-Assisted Big Data Analytics  
Term Project (Units 1–3 Integrated)

## Contributor
Caleb Brunton

---

## Summary of Contribution
My primary contribution to the term project focused on the **analytics and visualization layer**, specifically the design, implementation, and validation of **KPI 1: Real-Time Temperature & Hourly Change**, along with supporting BigQuery transformations required to make this KPI feasible in Looker Studio. I also produced the required **individual analysis notebook**, including prompt logs, a DIVE entry, and interactive visual validation.

---

## Exact Tasks Completed

### 1. KPI Design & Interpretation (Dashboard)
- Implemented **KPI 1 — Real-Time Temperature & Hourly Change** as defined in the project blueprint.
- Clarified and documented aggregation behavior when **multiple cities are selected** (averaging across cities vs. single-city focus).
- Configured Looker Studio charts to support:
  - City dropdown filtering
  - Time-series visualization for real-time temperature
  - Hour-over-hour temperature change visualization
- Ensured KPI aligns with project goals of short-term trend detection and real-time situational awareness.

### 2. BigQuery Transformation Support
- Identified a key platform limitation: **Looker Studio does not support SQL window functions (e.g., LAG)** in calculated fields.
- Proposed and validated a solution using **precomputed BigQuery logic**:
  - Hourly temperature aggregation
  - One-hour temperature delta calculation (`temp_delta_1h`)
- Integrated the derived dataset (`live_weather_with_delta`) into Looker Studio for downstream visualization.

### 3. Interactive Validation & Analysis Notebook
- Created **Final_<Name>_analysis.ipynb**, including:
  - Prompt logs documenting AI-assisted reasoning and troubleshooting
  - A full **DIVE analysis** for a substantive question related to KPI feasibility
  - At least one **interactive Plotly visualization** validating hourly temperature change behavior
  - Direct link to the Looker Studio dashboard section I influenced
- Used Plotly to independently verify trends and deltas outside of Looker Studio to ensure correctness.

### 4. Presentation & Demo Support
- Assisted in preparing the **single-slide dashboard summary** for the live demo.
- Helped translate dashboard visuals into clear narrative explanations suitable for a 5-minute walkthrough.

---

## Repository Contributions / PR Links
> *(Replace with actual links if applicable. If your group used direct commits, that is acceptable.)*

- Analysis notebook:  
  `notebooks/Final_<Name>_analysis.ipynb`
- Dashboard logic & KPI design:  
  Looker Studio (dashboard configuration and calculated field usage)
- BigQuery support logic (conceptual + validation queries):  
  `bq/sql/` (if applicable)


---

## Lessons Learned

- **Tool constraints shape architecture**: Looker Studio’s lack of window functions required moving time-based logic upstream into BigQuery, reinforcing the importance of choosing the correct layer for computation.
- **Streaming data needs stabilization**: Aggregating minute-level data into hourly buckets significantly improved interpretability and reduced noise.
- **Filters change meaning**: Allowing multi-city selection changes KPI semantics (averages vs. single-entity trends), which must be explicitly acknowledged in both dashboard design and presentation.
- **AI is most useful when validated**: AI-generated suggestions were valuable for ideation and syntax, but manual validation against actual data was essential to avoid incorrect assumptions.

---

## Final Notes
This contribution demonstrates ownership of a **complete analytical thread**: from business question → technical constraint → data transformation → visualization → validation → presentation. The work directly supports the project’s real-time analytics objectives and integrates batch, streaming, and visualization components into a coherent KPI.
