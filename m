Return-Path: <linux-clk+bounces-27383-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF21B4623C
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 20:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845941B2235F
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 18:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2184261B91;
	Fri,  5 Sep 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OotgecdI"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722F33E7;
	Fri,  5 Sep 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757096913; cv=none; b=loOjhEaWL8/Mi5UosQ95172NgLU2VYATyy4RKEXCUfs1OAiY4BMUpi+o7XXe0UrYeaQhqU8g8nJoqhrm63oSwtfNO0lMmySMNkYTTNQPLbh8mGSeuMmYcS/xGp9/9rFn7nLh1J+ILlIXueYQ1hlFGjKRmBIJV6rgOYkNMAQA+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757096913; c=relaxed/simple;
	bh=gvlpwRNtZnIGPhG7S6zJZs/7xh+8sbv8Bx4xDVNZaaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+j3s59hrzF8ZgO6FtiY1dHanP/FFYMW5fZrOORS1YNdv9QV/cOpodrV3DxTRLJxj4Py1x8NJF8NfHZ5GGWa97LL3VlzVOBMUKkbHdPMcf2vjp3SFTRqg/tQMsRhLHhwDFW/9may+XKnp4e93W5ZOaXo7f+LH9b6huCPlLNKr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OotgecdI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26872C4CEF1;
	Fri,  5 Sep 2025 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757096913;
	bh=gvlpwRNtZnIGPhG7S6zJZs/7xh+8sbv8Bx4xDVNZaaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OotgecdISxk6kWKWnSDQYxp7at6LsdwLy6Ko3CjW/0iR212vxzjkOjrEEZyx5g/A3
	 pp1lH98V9O0sJqlQnNscYbjEapYQbJLDHUPM0b4xvsu8UfIGVIYFovlsxMIHVhNZTH
	 Q0PrGULAXljxr4kpmHJxDQVBErqV85O+1e3NKySx8herH0soBWOuajBzIlqhuR5q1k
	 xdLlf9eKVtjipig6m0+bO5U0MRLKCjkhU0bXQJ5nxkYsDDXoNvT/R4WoZPsS386HJ9
	 sXj+GJFfADGJsqVi1U5pVj7P0bHtxDhtzylcZMYvbHIMCeyw55ua5FVaBmscNo1b3r
	 M2Tnh/YR5/EEg==
Date: Fri, 5 Sep 2025 19:28:27 +0100
From: Conor Dooley <conor@kernel.org>
To: chuan.liu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
Message-ID: <20250905-datebook-excuse-659da9b41d8b@spud>
References: <20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com>
 <20250905-add_video_clk-v3-1-8304c91b8b94@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tp/2PmSvCUVt5yEJ"
Content-Disposition: inline
In-Reply-To: <20250905-add_video_clk-v3-1-8304c91b8b94@amlogic.com>


--tp/2PmSvCUVt5yEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tp/2PmSvCUVt5yEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsrywAKCRB4tDGHoIJi
0hR+AQDCr0nevvM8U0I/9Maks/GUrWECQUm7mVu1J/fU9cV7awEAnWatZjLmHYF8
WW1uD9ucXu1VnPgvK3uEC9EvFqfHLw8=
=+jIT
-----END PGP SIGNATURE-----

--tp/2PmSvCUVt5yEJ--

