Return-Path: <linux-clk+bounces-6189-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EB8AB8A7
	for <lists+linux-clk@lfdr.de>; Sat, 20 Apr 2024 04:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2068B1C2085A
	for <lists+linux-clk@lfdr.de>; Sat, 20 Apr 2024 02:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E9C10F7;
	Sat, 20 Apr 2024 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s24q2kct"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE9AA48;
	Sat, 20 Apr 2024 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713578936; cv=none; b=KMrVKLihYV7ucdf5+KncsAkEZ4cnRr84HcepJie3gVe8lYKnLFhbzL8BOBiStnxy0XB6Gi4C9LcQ7l7E0rZW9QceiLeKcEqUiOZszYwjlwCcOB4swQGRjTEs4nQnn6eeBy3uU9VR/oXWXUPf21ZqIwcGhzikrrXznbzJ4iBrT1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713578936; c=relaxed/simple;
	bh=Cyt8H6zrMMIcpNvqq6mqdrTpbmNuf/Lzpu8CGT92vME=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mCMtOO0d6lTfzS10RcTLXckkOAPnpunfH9qCpzbIFOhQdQuW5Ld2ZCGeTBnQB16LyokvOUrvsda1cj0BjX1iXFNiZi+WlSF0bqY0y0mb18TdVBe8Rfs/Kw4op5+tBrZdFFrXbp65UBNG1PruliMh/pNpMxAKlkCWlVgmCz9HOiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s24q2kct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCF1C072AA;
	Sat, 20 Apr 2024 02:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713578936;
	bh=Cyt8H6zrMMIcpNvqq6mqdrTpbmNuf/Lzpu8CGT92vME=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=s24q2kctdm/aFAI2cjXzNm/V0BxyWKdHfulVDCoS7xd9cFsNRMYu6ogiSRahkhSsz
	 QlKCRtnd9MNWEhjxTlhB28/KlAbZl0JqxIWBqyoKRfNgbvOdtifN2mwr6gDEp/4MP4
	 piYzPcPcVViP6nPQgaTUBCnBBrVgsJqH1r3sgtudetDssXi+UJ/6+8Dd/AuVLhAOWp
	 275QSIk0n1g5a142Q50GFqoE2ue750IfI0xPE1sjPnHE673qAnr7+BxP+fN9AYKxhX
	 QiD1zk6CQPDj1VV+KRC1AW4uOfm8D4PhgwGQ4HJiV1j8IkWCW6ZitaqGReWUw+35zP
	 cb3TmyopQcLAQ==
Message-ID: <6b8e12767fdfaf1ba819896fbd610733.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240415163649.895268-1-cristian.marussi@arm.com>
References: <20240415163649.895268-1-cristian.marussi@arm.com>
Subject: Re: [PATCH v3 0/5] Rework SCMI Clock driver clk_ops setup procedure
From: Stephen Boyd <sboyd@kernel.org>
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com, quic_nkela@quicinc.com, souvik.chakravarty@arm.com, mturquette@baylibre.com, Cristian Marussi <cristian.marussi@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 19 Apr 2024 19:08:54 -0700
User-Agent: alot/0.10

Quoting Cristian Marussi (2024-04-15 09:36:44)
> Hi,
>=20
> a small series to review how the SCMI Clock driver chooses and sets up the
> CLK operations to associate to a clock when registering with CLK framewor=
k.

Did you want me to merge this through clk tree?

