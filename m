Return-Path: <linux-clk+bounces-15792-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C09F080E
	for <lists+linux-clk@lfdr.de>; Fri, 13 Dec 2024 10:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19EA916894B
	for <lists+linux-clk@lfdr.de>; Fri, 13 Dec 2024 09:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A3B1B21B9;
	Fri, 13 Dec 2024 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpdbt93B"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8E1B21A6;
	Fri, 13 Dec 2024 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734082723; cv=none; b=HZcyeasyi8UkxtOLZB6CiI6Edj0q22rb3JAclG4ADk/Dz8RhQNYnMpzjdaSY2sGjkMbMCpdFNaZyhdqy423oP/2LYoViGpvMU2IhrRcZfMJskxrVeRepUvzlD0OcPY02yrWWD1jYN9kt5jNRFbsYgJwOUbhpfdYn7LUEckRykrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734082723; c=relaxed/simple;
	bh=C4aGIzyorq1tBVI1yJw5rYLsVVjKp/X1Nqg1zAA8RX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU+jQi2XnhW5MR42jXrcbyVggNi/QWCXleM4/UTRCBB2UbZi30OjFZIYUA1tM9rZCuKUTu0PLpT9kjNLxy49t8qFBZ6z2ZAZO28XSXTfhCIUrsgJmaPYwg8mk8s21jC1URmAk6epsuEv1lqo9Tz4L+HayQaLnCFuWy8vhIq2aZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rpdbt93B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43267C4CED0;
	Fri, 13 Dec 2024 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734082722;
	bh=C4aGIzyorq1tBVI1yJw5rYLsVVjKp/X1Nqg1zAA8RX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rpdbt93BrH6lcY1g/FiyFPVSILi66UJCH3990Nc/SU7MOqEax59cXywjJa1b5rBp2
	 aEOGhQG/5XrKhPljF/F1ZYi8vSNneWmbzFCvg3+6fT2ypW9hqHwlgq1AlrZNTkdqSE
	 IFBQ52HLd0QWzj3hDRgFM5mjofMDFMECKipALTbf56JIg6zgds+z9r8Gk0RhWh+M9c
	 Ive5Krd4XrSYDf76q1n5wrVtUwDdb04onS7wgR1IvV3eZ1aWO0RU0cBjCbsheO+90L
	 5qrCoKtCXyx/Lfn3NIOmaKIVrp/bpt6VzGY64RRAHMcCSYdxL4jaF6npngBzVf+fL6
	 oLEAKB1Lf6www==
Date: Fri, 13 Dec 2024 10:38:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: gcc-ipq5424: add
 gcc_xo_clk macro
Message-ID: <lnokizokuln4qxgeqvk6g3rddmukvcwx7r235udfaks3xymnqb@27xbgx7ehzcr>
References: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
 <20241210064110.130466-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210064110.130466-2-quic_mmanikan@quicinc.com>

On Tue, Dec 10, 2024 at 12:11:09PM +0530, Manikanta Mylavarapu wrote:
> The GCC_XO_CLK is required for the functionality of the WiFi
> copy engine block. Therefore, add the GCC_XO_CLK macro.

"Add the GCC_XO_CLK clock ID for the clock required for the...."

That "Therefore" is really not necessary.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


