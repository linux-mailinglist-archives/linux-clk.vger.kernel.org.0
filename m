Return-Path: <linux-clk+bounces-25679-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23B8B1D351
	for <lists+linux-clk@lfdr.de>; Thu,  7 Aug 2025 09:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 747A13A8423
	for <lists+linux-clk@lfdr.de>; Thu,  7 Aug 2025 07:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FAC23A997;
	Thu,  7 Aug 2025 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdWc4I8g"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554423184F;
	Thu,  7 Aug 2025 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754551748; cv=none; b=ZKhw6bd1i6fNbxImZwlFdDvLrkv35DIZAHtg4Lqgvhrh/py2ICojJvPc1BO7Sgbr+y8LfpVL00nJrPPOY7YZBrLPQ3xFGAS+eU593XQ4Q4f+pBnnX6+9+s8sdMWWwDGI8sDl4GqQ43BeRCC4gKnqsNlW26WotO9n2JAqpVLSGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754551748; c=relaxed/simple;
	bh=BPOrOe6Ks1WSFeqdgv+rLZaq6MjbwOFkeEJJHOUYbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M71ZtKjYt/FW3fE2hIM8zlETX9bpCjsmJJfku2zxYHUCHz4Uq/GHbKj7ukl1lF3J2wwSxJ/nGpa9HyNw0NNxgaZjFX+UbAeWeEZ0/Ab9TSiEYnJ4+PjP0GM+06SwL2N+BDkR0QNGvBiZt7CuvMANxeG21W3Qn2lIkn1ci0H6Jb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdWc4I8g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A37C4CEEB;
	Thu,  7 Aug 2025 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551747;
	bh=BPOrOe6Ks1WSFeqdgv+rLZaq6MjbwOFkeEJJHOUYbIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdWc4I8gF0rtG32Vov1M61PgSNVNH5fNQBqZavWPSx6RrwL9naqlfeKshageFZsEa
	 pcullofjttvEKmZNgF7FlPvOtXhiaQJ3Hi5idPJqtzJNu6wxBt8tccKuSuqE163Mtt
	 aw6i++aPgfPE+0fJXFS/uJ5w9tMWlPl2n33m0Tw0fbG52ZnzctZQlUd/kw9tTCWxTl
	 RZB15zs8KVwtYd8E31X0imhQyAFM2FqUkkxifWTHSzsvwoC6vU9PAi65uBVgW4UvXm
	 NnXQGhSM7zby1FRQ1uC2w2nZqk+ww7vYElEmLoI+UTD0gD3om89MxeYsxHdpSO9y3v
	 aglCu0I9UNmXA==
Date: Thu, 7 Aug 2025 09:29:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add
 optional ldb property
Message-ID: <20250807-airborne-rich-lobster-6f8e2e@kuoka>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250806150521.2174797-7-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250806150521.2174797-7-laurentiu.palcu@oss.nxp.com>

On Wed, Aug 06, 2025 at 06:05:13PM +0300, Laurentiu Palcu wrote:
> Since the BLK CTL registers, like the LVDS CSR, can be used to control the
> LVDS Display Bridge controllers, add optional 'ldb' property to handle
> these use cases.

You did not add property here. You added child node.

I don't understand the rationale at all. How the registers could appear
in this hardware? What changed that registers were not there?

Why every device here has ldb child? Why camera has ldb?

Best regards,
Krzysztof


