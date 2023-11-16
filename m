Return-Path: <linux-clk+bounces-243-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A07EDD1E
	for <lists+linux-clk@lfdr.de>; Thu, 16 Nov 2023 09:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0931C203A5
	for <lists+linux-clk@lfdr.de>; Thu, 16 Nov 2023 08:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347B412E4B;
	Thu, 16 Nov 2023 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hbry3TeN"
X-Original-To: linux-clk@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEA4A1;
	Thu, 16 Nov 2023 00:51:20 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BF9826607337;
	Thu, 16 Nov 2023 08:51:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700124679;
	bh=DqmuAspJuC+u+5khGNbyPkSM/AWgBnoD3ON+vRqFxEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbry3TeNmf6wo2GjK0QRPFfwYDol5mVaFG2MbMZ46WWBur37/LA8NpOwX+lDw6cni
	 FKJGb78WRqJCgLwCoKEREKKmYHJTj4qE1DituBAp4vTYBAgvyTcLcQxmYrpUZyCohn
	 Dm8fBdXNjvw31+mnNLqextpgegosAjzMl7Mrwh5fazOIJk0b4thYtc8SQKNPsPzsxw
	 hZ0FGYZxUx5rj2+v9+AqFUdmHhv6Bo+tqIUVKak64ENpiLUh7pNRAq/+Z9kxupyJ8K
	 Lriny8urjvLYhmmzyTHZ8i6hlQYsxRFZIqanA0zLhdbSgmeWcK5NFNea0ocMK2bKyq
	 YDhhP1+vPSHNA==
Message-ID: <ca7be6c2-d3b4-42ca-bc16-b8cc88a5a832@collabora.com>
Date: Thu, 16 Nov 2023 09:51:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: mediatek: mmsys: Add VPPSYS
 compatible for MT8188
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
 <20231116080129.20617-4-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116080129.20617-4-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/11/23 09:01, yu-chang.lee ha scritto:
> For MT8188, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



