Return-Path: <linux-clk+bounces-4689-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6287DF94
	for <lists+linux-clk@lfdr.de>; Sun, 17 Mar 2024 20:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C79B1C208F0
	for <lists+linux-clk@lfdr.de>; Sun, 17 Mar 2024 19:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4191E527;
	Sun, 17 Mar 2024 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCdDUd6X"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF041CF9A;
	Sun, 17 Mar 2024 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710703004; cv=none; b=O4FU8+TfBbAf0Tt2r/cpRwTq0w2JzyL/zOk1r6EMrp6dfJn8zWJQ1JVRc52chrkLtqxm6S3WLQMbq+qwYaI3N3/v9wNmSjC2N3UKAKffazlOjTpDpSdZo0WUgqyjn5gmUpja4yq2ZN6BPiIUvnJWMg6iVCJJcr3aWC+YuTQCwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710703004; c=relaxed/simple;
	bh=7wgxPIyPTJm1sbVQLW+1u/0UytpBtpCuchrtZamPsh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvKrygeV+0cYzNILHum2UAz78MwBWar9/2+qYNuhqMokf//hS8eIeVMWNSr0GVrfzxuU5GoX/PlBQ5rh/OBdvjVNpnr9ucrkHECiP4ydw1ZK4Ti1qOQN91h73F4+iAT7DZMY3UAw8G19Rw7Q4beDzBWMth0eBosy3qItCaYyn78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCdDUd6X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28F0C433F1;
	Sun, 17 Mar 2024 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710703004;
	bh=7wgxPIyPTJm1sbVQLW+1u/0UytpBtpCuchrtZamPsh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCdDUd6XU5vR4dSofVsop9l+p6Dl2b5mAPLEOUE7ukSv4/Y8P/BVftbMzhxOhf7LX
	 6qIkoK14BS+DxglAcIaMLD847oylzu+ss8P1wMeR/0aB68MBkwaI1zpEB8YN9tH7PQ
	 QjraJ7ZUXmNmE+XSFJhRwr6aTD30kEkxM1sG5KmeFXBGS2LEx97GbmteJwoqE7/B0P
	 JAwqVb6hONCDlvIZNVGYH9BQrBaXwAlMHQquP5Qx3kFTSDbqsr1CdAUWQD9bzjPQc4
	 XoaWBS7iu1PMSMw2U0CPddNlsPWDjJ3WoCrPWmG6teSrG8+yqviCF6Lr23hiOoYxvG
	 eXsdYplLneFhg==
Date: Sun, 17 Mar 2024 13:16:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
	kernel@salutedevices.com, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 20/25] ASoC: dt-bindings: meson: axg-tdm-formatters:
 claim support of A1 SoC family
Message-ID: <171070300107.2091785.7788958335533419953.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-21-jan.dakinevich@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-21-jan.dakinevich@salutedevices.com>


On Fri, 15 Mar 2024 02:21:56 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-tdmout" and "amlogic,a1-tdmin" compatible string aliases
> to "amlogic,sm1-tdmout" and "amlogic,sm1-tdmin" respectevely.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


