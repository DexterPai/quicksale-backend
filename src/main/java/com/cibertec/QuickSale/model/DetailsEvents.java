package com.cibertec.QuickSale.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "detailsEvents")
public class DetailsEvents {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idDetailsEvents;

	@Column(length = 1000)
	@NotEmpty
	private String description;

	@NotEmpty
	private String title;

	@NotEmpty
	private String comments;

	@NotEmpty
	private String urlImageRef;

	private String status;

	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_Event", referencedColumnName = "idEvent")
	private Event event;

}
