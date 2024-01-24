Return-Path: <linux-clk+bounces-2789-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C603E83A17C
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jan 2024 06:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F75A288E7C
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jan 2024 05:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADF7DDCE;
	Wed, 24 Jan 2024 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ry/iJkcO"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66221F501;
	Wed, 24 Jan 2024 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706075090; cv=none; b=hd64UdJM9DDHcD8hRHLbNL+Ool7Gq2VkqZSLlDRMS2PlckvfUm6zy5JLNfI3QOKQx6wQAMvBk5efabi2giJxaW9KWjPH8tPewlb3PGCZH/2fbmtrS0PjFsR+qyqusPdn5yLlhPhMgQFDF99k4Jw2em2XivoYXH4QFAAfFreJXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706075090; c=relaxed/simple;
	bh=wydq3m3awroYwRKyCn8UdwP+RAL9z4c7EejX5926Jyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNS/gFAA1EAitMFIpAdhBPESLfn/ueCWAw57JTpnnYToa2I6CmwwHMw40q9xqTjw3d7GmUKgjFuI5akz39M87cNxyBEPb/yLGH+capm5geIHXAVbKpa0BG0XPZYNs7k58IyqLKG/mjZKd79a/hXrBfhLChRT7EkY/asx31g2j80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ry/iJkcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB01C433C7;
	Wed, 24 Jan 2024 05:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706075090;
	bh=wydq3m3awroYwRKyCn8UdwP+RAL9z4c7EejX5926Jyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ry/iJkcO2HUVEdQ7x7oBemcfuHqJLabZ2pEtEkfpCmGxW+KA1kPHTtCLCH9cdugrE
	 ifbeEdyDnPdsimCGVzqKdQtuHze+DLoBulaP5++3w/72QxWVQwSEizTz+IFImdiZ1w
	 FaQUp8lZumV5yd64FOj0MErKaaoKUuJY+JOvwLTTqpe9O4XIJmoW1DAnEiWez+Nlst
	 NrUNpAS1Ks8Y4BoaX0+FBEiUGWK3RYWMUylRn8Ka+N/VNXdZD+zUqWBTDbleMGwxEu
	 8Rs1GKw6RzShKppIdHvtzgbdmPvb1WF2QzprGmU++4NfjllOl9lPwSK4Zy3AqBtFGZ
	 bO/B9sQMFANWA==
Date: Wed, 24 Jan 2024 11:14:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, sboyd@kernel.org,
	mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, quic_cang@quicinc.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 01/16] dt-bindings: phy: qmp-ufs: Fix PHY clocks
Message-ID: <ZbCjzeMTKtbRxJHw@matsya>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
 <20231218120712.16438-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218120712.16438-2-manivannan.sadhasivam@linaro.org>

On 18-12-23, 17:36, Manivannan Sadhasivam wrote:
> All QMP UFS PHYs except MSM8996 require 3 clocks:
> 
> * ref - 19.2MHz reference clock from RPMh
> * ref_aux - Auxiliary reference clock from GCC
> * qref - QREF clock from GCC or TCSR (since SM8550)
> 
> MSM8996 only requires 'ref' and 'qref' clocks. Hence, fix the binding to
> reflect the actual clock topology.
> 
> This change obviously breaks the ABI, but it is inevitable since the
> clock topology needs to be accurately described in the binding.

This fails to apply on phy/fixes, pls rebase

-- 
~Vinod

