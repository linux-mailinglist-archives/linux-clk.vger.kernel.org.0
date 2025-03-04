Return-Path: <linux-clk+bounces-18882-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC43A4D4DE
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 08:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A65253AA9BB
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 07:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1801F63E1;
	Tue,  4 Mar 2025 07:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNaHQylf"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFE8AD24;
	Tue,  4 Mar 2025 07:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073720; cv=none; b=VJSAMazTtQDaJ38Kk5X0+sx06Vfr2CLPP2S2wMpFORjgCfselz4iRjtDdZQ1X6HuwgBedQnARMIW00s1Fz9fkYU8kVV3G4C/Nh1kzSB6UP6yvk0PZ4Uik1B5D5W2XPxN4mdz/xp5umv/hG7JkJSJY+6nkkaMxhFzit7GGrTMcDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073720; c=relaxed/simple;
	bh=BKl3YpxP921qg6Y9Mt0kJy44103dFeFyCIdjzDwM11s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaKH4YKSIwj0eMRpcjgMdGHRBJoEzYUjf+zqowfUaTSthTUUPehsRwZ9lcs2yL3UQhiJzxr+UYLTGgx37JD3JhdsqfobjvDnYiMIUgKH7A5S1ZF9aqNXb0crsiAiaXtOsLvOHVl2Nn7nztrrtpPb9ds8mw3c6iOnDkl3xB7l8oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNaHQylf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DCFC4CEE5;
	Tue,  4 Mar 2025 07:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741073720;
	bh=BKl3YpxP921qg6Y9Mt0kJy44103dFeFyCIdjzDwM11s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNaHQylfVrNjgjfpQYhM9j/+K0ka8a+tNMEms/EW5ovxQ6etN1pULMMQ2teBYIMQH
	 o5LN+8AqCm4zLo51UDh0nGEMvE+W6RcDBT0yITvUjYDC4qfFRkFa4v6H/QW7onq2j1
	 zwIpgfF+j+NM0r7gj4CziF4RVthdIFSQ5gWsHvpPNPaYE8Vl6CaRZt1pviY7vdtr8V
	 KzHQqG86iS8vq8+Ap8u1ddREOBQ6SngrEc+wc20e+mv73jMXmY1ROja0w2qbxgM4Pe
	 pqyfktB0kzxZSROBSXfOQcuEKeDtIs0Ih4cuCxeC5JaWfknwXdMsr1dSy+t3XqOekP
	 lnSrg4H8wroUw==
Date: Tue, 4 Mar 2025 08:35:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alex Elder <elder@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: brcm,kona-ccu: Add BCM281xx
 bus clocks
Message-ID: <20250304-fat-nebulous-meerkat-008f04@krzk-bin>
References: <20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com>
 <20250303-kona-bus-clock-v2-2-a363c6a6b798@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303-kona-bus-clock-v2-2-a363c6a6b798@gmail.com>

On Mon, Mar 03, 2025 at 09:27:50PM +0100, Artur Weber wrote:
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
> index d74ca42112e79746c513f6861a89628ee03f0f79..15449f998eb7a5a191fd847b689cfbe60b27c541 100644
> --- a/include/dt-bindings/clock/bcm281xx.h
> +++ b/include/dt-bindings/clock/bcm281xx.h
> @@ -34,7 +34,9 @@
>  #define BCM281XX_AON_CCU_HUB_TIMER		0
>  #define BCM281XX_AON_CCU_PMU_BSC		1
>  #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
> -#define BCM281XX_AON_CCU_CLOCK_COUNT		3

You cannot change defines, it is an ABI. Unless it is not an ABI... so
just drop all these counts in separate patch, just like we were doing
for other platforms.

Best regards,
Krzysztof


