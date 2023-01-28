Movie.create!(
	[
		{
			name: 'ジョーズda',
			year: '2023',
			description: '映画だよ',
			image_url: 'https://picsum.photos/200',
			is_showing: true,

		},
		{
			name: 'ababa',
			year: '2022',
			description: '映画だよ',
			image_url: 'https://picsum.photos/200',
			is_showing: false,
		}
	]
)	

Sheet.create!(
	[
		{
			id: 1,
			column: 1,
			row: 'a'
		},
		{
			id: 2,
			column: 2,
			row: 'a'
		},
		{
			id: 3,
			column: 3,
			row: 'a'
		},
		{
			id: 4,
			column: 4,
			row: 'a'
		},
		{
			id: 5,
			column: 5,
			row: 'a'
		},
		{
			id: 6,
			column: 1,
			row: 'b'
		},
		{
			id: 7,
			column: 2,
			row: 'b'
		},
		{
			id: 8,
			column: 3,
			row: 'b'
		},
		{
			id: 9,
			column: 4,
			row: 'b'
		},
		{
			id: 10,
			column: 5,
			row: 'b'
		},
		{
			id: 11,
			column: 1,
			row: 'c'
		},
		{
			id: 12,
			column: 2,
			row: 'c'
		},
		{
			id: 13,
			column: 3,
			row: 'c'
		},
		{
			id: 14,
			column: 4,
			row: 'c'
		},
		{
			id: 15,
			column: 5,
			row: 'c'
		}
	]
)
Movie.all.each do |movie|
	movie.schedules.create!(
		[
			{
				movie_id: 1,
				start_time: "2022-01-01",
				end_time: "2022-02-01"
			},
			{
				movie_id: 2,
				start_time: "2023-01-01",
				end_time: "2023-02-01"
			}
		]
	)
end
