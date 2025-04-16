Return-Path: <linux-clk+bounces-20546-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB59AA878A3
	for <lists+linux-clk@lfdr.de>; Mon, 14 Apr 2025 09:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C371891B69
	for <lists+linux-clk@lfdr.de>; Mon, 14 Apr 2025 07:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5659C2580F5;
	Mon, 14 Apr 2025 07:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWYAl3mV"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7942580ED;
	Mon, 14 Apr 2025 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615429; cv=none; b=GvXnL3wkePr9Ard8Gc3/11WYylOlStez8OwK6NVgFM1xSS9AmlqPFpyOA5zvT13HxCFif+J/phfsjgF4rMp9AeFLp0CzvsegLlGm0q8VwolhsZXZewe2LdGSpfzfHRJqgdjXyWoQGsz9Ik33e3d7yvBXEfdnTQjo3xDnHYIW+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615429; c=relaxed/simple;
	bh=G2oIFEzK6mj2r/1QbMhHoZ9M5B89hRoZaffofIX9Xgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsPsJa/tIlHL9XexsATYhNg3Ao1VCR0O8e+TBg9b3BR+k4KTJUfw0bAezqJG4jtg2eSFM6Mn0TU8fqvKVWu3uYQl7R5m7goGqD4KvP7pmuxke/HXg3EWSct5YSQmUtArOVAzOs1Jzj9CxEtddyfMJRS/d/Y+S/sBEBpmkfVJamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWYAl3mV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD94C4CEEC;
	Mon, 14 Apr 2025 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615428;
	bh=G2oIFEzK6mj2r/1QbMhHoZ9M5B89hRoZaffofIX9Xgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWYAl3mV7DIXxxUEpAc1SaZaLNosxof8IsmQphzeLhc39H49noHqUeEN4mtI2EzT2
	 HtwhZXTYoXXV8ymqzl6puUZICTT8oAMoDVaXTBrTsQ+wIY3YG7BJvkgiDUO46hnS2f
	 5Or/GseHd8P1unnlT4/9EVUzDkxdj6pWLqqY3Djt/Mb7sLqBhv284Wsmc6u2ePbRA+
	 C4wf8Dmn2aND+rNTK4Rp0HgRbbhpPVRk7LJAS1QX+10uZDz/foSGM6OXHaJXzRfdhX
	 kXGB2h/EnFgf/LiomUk4/DugMWIm3hMpkOYpnnq+rjX3RCHTODhVZcfF3okvwaU/Al
	 p1GF5S88MKH0w==
Date: Mon, 14 Apr 2025 09:23:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20250414-beige-guillemot-of-purring-52d5b7@shite>
References: <20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de>
 <20250410-clk-cdce6214-v3-2-d73cf9ff3d80@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410-clk-cdce6214-v3-2-d73cf9ff3d80@pengutronix.de>

On Thu, Apr 10, 2025 at 12:34:57PM GMT, Sascha Hauer wrote:
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
> new file mode 100644
> index 0000000000000..1b41060896cc3
> --- /dev/null
> +++ b/include/dt-bindings/clock/ti,cdce6214.h
> @@ -0,0 +1,24 @@
> +#ifndef _DT_BINDINGS_CLK_TI_CDCE6214_H
> +#define _DT_BINDINGS_CLK_TI_CDCE6214_H

Missing license.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


