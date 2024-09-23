Return-Path: <linux-clk+bounces-12302-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF697E7BA
	for <lists+linux-clk@lfdr.de>; Mon, 23 Sep 2024 10:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D203281CF9
	for <lists+linux-clk@lfdr.de>; Mon, 23 Sep 2024 08:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619A7194090;
	Mon, 23 Sep 2024 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JkzibY8y"
X-Original-To: linux-clk@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460679DC7;
	Mon, 23 Sep 2024 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080788; cv=none; b=hYG/rqw3dmC2u7I5cfn9Ao4pZzUk1mkJ0Y8OpgmziPIpoLAlFUry2Qu71m/MWQbjVabspT9Vp4npSAIpG/UQ8RMEgqUmG2nlSr0YKhpl1TqJEXjSZ6vo71vqCymoIMHWbg4N8SH6TPOw9xBWPwKXFQR5wNDhxzGWptjmcLsIExk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080788; c=relaxed/simple;
	bh=bSnbgZUAu2nk9hGR+H3RrZqnwocCi9HL5rpRcPXtGaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFR2qzhnQa7JvrwEto0pbqqLcvyMLEuWBLwQPuxIITfLzuNiSKPODPW/hmzFJmJbp+ZZn7ewuGr+zHC24Qf9sx42yopEwTxImCdzeVouOjysiZMMhGymdwZz7jRYJVyxDCi0vkHgXE5KhRmP6j6bHOjPbCaXAYtRF+jIaS6aCug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JkzibY8y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727080783;
	bh=bSnbgZUAu2nk9hGR+H3RrZqnwocCi9HL5rpRcPXtGaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JkzibY8yNoTP0KVx9uvdQYEKOluf/YYmnFnjWXH9RkneDbndgYynZYAtEgd3JDo4+
	 1iLmgiTGCcZyz24ISK1uM9G1+G9+VR/4jX6qADGbfXGSiL4vK5cLYeFv4OiPaYA5Wz
	 sHWpRtI0o899VRGs6shQ9/z5cDA6PW/m+vmj2EAIpfVmHOmlL5tpmapKkpE29JioCa
	 y2zj87+GisB5Y36KWf/f3dFD4JolE8beUs7dddk68Rmo6pUzyy7XFztVv42mA1v/bi
	 x7CJHSQErAy5x4gAL1CWENK599Fi5MvsCnJg+Rg4ZflyeLhpksz0ATwdC40keXqL2a
	 svVCitdpgG9RA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E0DC17E1060;
	Mon, 23 Sep 2024 10:39:43 +0200 (CEST)
Message-ID: <ae69d0f6-97ff-478f-8e58-662fe4a923f4@collabora.com>
Date: Mon, 23 Sep 2024 10:39:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt8188: Add efuse for GPU speed
 binning
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-5-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920134111.19744-5-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/09/24 15:41, Pablo Sun ha scritto:
> The OPP table of mt8188 GPU contains duplicated frequencies
> for different speed bins.
> 
> In order to support OPP table, we need to provide the speed bin info
> in the efuse data so the GPU driver could properly set the
> supported hardware speed bin.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



