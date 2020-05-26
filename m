Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20ACE1E0AF8
	for <lists+linux-clk@lfdr.de>; Mon, 25 May 2020 11:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389528AbgEYJrI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 May 2020 05:47:08 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:14792 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389475AbgEYJrH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 May 2020 05:47:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590400027; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nzc2bGnfZw3EYhLsT6vL//x7Kf1J15GGIKlmgweEp8c=;
 b=B+lCFq7MhbWWEim1cOmEOits+2S6ldjCXGPmQ8p/aRIU1Uu0lejk2FzQ/wBG2PBBxpeAcV4w
 rHah0LxXbShc09FFDIdtvrzTG92kfG6WkQLMxOcr6g8LW7ZPxvc1xmR0BymQzf5S/RaKSCVi
 NnET6ef98D2ihgrsEpBgASr4gzY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ecb9416c60c306cc85162b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 May 2020 09:47:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BCA4C43391; Mon, 25 May 2020 09:47:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 08818C433C9;
        Mon, 25 May 2020 09:47:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 25 May 2020 15:17:01 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 08/10] clk: qcom: Add graphics clock controller driver for
 SM8250
In-Reply-To: <20200524210615.17035-9-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-9-jonathan@marek.ca>
Message-ID: <c4d43cf01b6d014fdc2258abb94eb2c5@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jonathan,

On 2020-05-25 02:36, Jonathan Marek wrote:
> Add support for the graphics clock controller found on SM8250
> based devices. This would allow graphics drivers to probe and
> control their clocks.
> 
> This is copied from the downstream kernel, adapted for upstream.
> For example, GDSCs have been added.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Since this is taken from downstream, maintain the original author's
signed-off and add yourself as the co-developer if you have done
any modifications. Same applies to all other patches.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
