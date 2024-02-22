Return-Path: <linux-clk+bounces-3946-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ABE85F132
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 06:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82196283909
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 05:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F3C12B7E;
	Thu, 22 Feb 2024 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxdS2BWF"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01651C14;
	Thu, 22 Feb 2024 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708581536; cv=none; b=m7cEdEbDT5EbTGDx6HUzOdMxfIOJcmads5yWGCJbVOOHMfnZXM/KX5C9Ai052EAXBimnL3DewbBJ9gCscDI1d+jBFi+X/HHJJS+L/tL3ZU0KQfRnv9kfXMqtyR2EZhwPUE1r9JIFZwsfZKO1ZU+9/XjnUquGqzddPF8A33cC880=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708581536; c=relaxed/simple;
	bh=sQC55hFRaSZSeaw3Mtrz9vBAtSzqenfjycnVwCMWniU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=G4hhq8O5sdm+bYkcjQXhAX7HgQXSD3v43EEyVAjGsthEza3tCu+UfPPZxqt6L73K3y731NdiaVBnmInqNYxLVqH8Y08BEcS3LpC2G+BnE4zmHA1qcqFGeKZdS0mky35fjVW0H0FUPDr15YLQPg9W1ngex/zVrFvV1htlkWvxJQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxdS2BWF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FC3C433C7;
	Thu, 22 Feb 2024 05:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708581535;
	bh=sQC55hFRaSZSeaw3Mtrz9vBAtSzqenfjycnVwCMWniU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hxdS2BWFXR46jTswAzQfohvMvfXftCmJQSpSw/AH4jSlFw/m01U+1T95VGrBKIcjx
	 etGvS+q6URb+G4qdE76hOtIU+I+sLyQnq2wB8J5wMBrp6+vHlnjdpLEhYQ9tgvGc8s
	 n9xS2DDWUHSHPYliIi78ntAQ0yNoWDv+8qkKQp4Sj1N8gqNF8Xm4Lezyd0Duy9KW9I
	 asteSCPEIewwpYzk/vPSDCZR7YYlnUug+h43GarxkTP64n5mZQ2Fpceo0TiWjIXZw5
	 TSAja/LedQT5NwJQtRhyeyBm73f+k1Yj+JHNApuYUS2fsM37Mcrot3UP2oKJ3As7g+
	 WJsJaiP28lrqw==
Message-ID: <bea8b72f61caaeac0ce112b57c28297b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240131182653.2673554-2-tmaimon77@gmail.com>
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-2-tmaimon77@gmail.com>
Subject: Re: [PATCH v23 1/3] dt-bindings: clock: npcm845: Add reference 25m clock property
From: Stephen Boyd <sboyd@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Wed, 21 Feb 2024 21:58:53 -0800
User-Agent: alot/0.10

Quoting Tomer Maimon (2024-01-31 10:26:51)
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.=
yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> index b901ca13cd25..7060891d0c32 100644
> --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> @@ -44,6 +54,8 @@ examples:
>              compatible =3D "nuvoton,npcm845-clk";
>              reg =3D <0x0 0xf0801000 0x0 0x1000>;
>              #clock-cells =3D <1>;
> +            clocks =3D <&refclk>;
> +            clock-names =3D "refclk";

The driver seems to want this to be a child of the mfd syscon. Is that
right?

