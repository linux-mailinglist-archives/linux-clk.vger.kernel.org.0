Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2544278B4
	for <lists+linux-clk@lfdr.de>; Thu, 23 May 2019 11:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfEWJDL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 May 2019 05:03:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbfEWJDL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 23 May 2019 05:03:11 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02FAB20851;
        Thu, 23 May 2019 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558602191;
        bh=APAdLdc4aUnrr4OGWWpPtgkb1rZfKzY77D7iZByOTpY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XU1tromCFZdkNuNP+vXyf+8vL2k6bsbuRHOeE7ICAOZrdAnnFgrGEI8DXZPuAMqR8
         7N6JuKZFh8w6EVUzyhHgjszYRF/8y/JLe1BmL8kmy9eyVrDRONof+x3UKtstlCT1/x
         F/u5EoUAvZDx+N4wa0w2PrvRLgUcfZvsrXkBd0l4=
Date:   Thu, 23 May 2019 17:02:12 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH RESEND] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Message-ID: <20190523090211.GR9261@dragon>
References: <20190520075959.29069-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520075959.29069-1-ping.bai@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 20, 2019 at 07:54:51AM +0000, Jacky Bai wrote:
> The MMDC_P1_IPG clock need to be on always on to make sure
> the MMDC register can be accessed successfully.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
