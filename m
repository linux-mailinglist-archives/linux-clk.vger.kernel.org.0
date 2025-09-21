Return-Path: <linux-clk+bounces-28235-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B36B8E478
	for <lists+linux-clk@lfdr.de>; Sun, 21 Sep 2025 21:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0108189B97E
	for <lists+linux-clk@lfdr.de>; Sun, 21 Sep 2025 19:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF8F27A446;
	Sun, 21 Sep 2025 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI3S/UVb"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303E82550BA;
	Sun, 21 Sep 2025 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758484255; cv=none; b=S9HJWU9EdqMD0vs8fkeJNooqxmI1gqFwWFvRczNCczgIJVwTg2YCJjPsap+YJkAbYamwUvRi1bMGl9vqS3tme+YuIrje19OtN+WjHJKDSIZ9cFKEs8qRjyCS2IqIbmFRsU5z2YdEBUzCVyQFYIvYp+uzUIej0hm59AvvVuQSIgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758484255; c=relaxed/simple;
	bh=sXQSIeKvQW+m59VyWsOc+W1lww9jnerq728I1dRb4po=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=b3K1L3JMyRmPPrhTc0E5z2huL7EbHqCEtwkzdoTUiMqwliTsjP9FylUGue0TqRK3iAbNtNh/Y3vJ675qnP63haApZvGbzF6Yygbvw/bxB5+CmFWLxZAm4w8IlHUNE7+2Vvw5URvdmiguxVRUXoG4dHRu6vCv3eJD4xNpndZub5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI3S/UVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFACC4CEE7;
	Sun, 21 Sep 2025 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758484254;
	bh=sXQSIeKvQW+m59VyWsOc+W1lww9jnerq728I1dRb4po=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dI3S/UVbay24xrx8PzYEJ+1YGM4x5nwI6qfbOvWThMvNeYfHFNp1jcxymJ1gN5mCf
	 ylJCvmbprv/q0Xh7KcMkf87wmmYh43vsI66srtcP8klCHVOwtB9GoxVCpfe0HelqN4
	 2GBxVr/L2FOBRpU/jS3tPG9v7/JZXeakXs90lKEkiqXRTQB/nrKuIKPUg+kyvbbKMZ
	 5ufZOva+8IKgi7G+3EFLjCMyc2dv6NLs7gbFcypmvddeSsni8pPMfsxjJvwIRgSCeq
	 hZrYwSLm7Ed3Wex79YkMxx93VXSX9jgtUQ5AvxSbgv3ekv8EQUm812bAfFMiRNPJNf
	 6VjoC58gpGMrA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250919142649.58859-6-ziyao@disroot.org>
References: <20250919142649.58859-1-ziyao@disroot.org> <20250919142649.58859-6-ziyao@disroot.org>
Subject: Re: [PATCH v4 5/8] clk: loongson2: Avoid hardcoding firmware name of the reference clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>, Yao Zi <ziyao@disroot.org>
To: Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Yao Zi <ziyao@disroot.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Sun, 21 Sep 2025 12:50:53 -0700
Message-ID: <175848425322.4354.14607215330062561253@lazor>
User-Agent: alot/0.11

Quoting Yao Zi (2025-09-19 07:26:46)
> Loongson-2K0300 requires a reference clock with a frequency different
> from previous SoCs (120MHz v.s. 100MHz), thus hardcoding the firmware
> name of the reference clock as ref_100m isn't a good idea.
>=20
> This patch retrives the clock name of the reference clock dynamically
> during probe, avoiding the hardcoded pdata structure and preparing for
> support of future SoCs.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---

Applied to clk-next

